import flask_api
from flask import request, jsonify
from flask_api import status, exceptions
import datetime
import pugsql
import os
import datetime
import dynamoPosts

app = flask_api.FlaskAPI(__name__)
app.config.from_envvar('APP_CONFIG')


queries = pugsql.module('queries/')
queries.connect(app.config['DATABASE_URL'])

@app.route('/api/v1/resources/posts/<string:comm>/<int:num_of_posts>',methods=['GET'])
def get_recent_posts_comm(comm,num_of_posts):
    recent = queries.posts_by_time_comm(comm=comm,num_of_posts=num_of_posts)
    return dynamoPosts.nMostRecentPostsSubreddit(comm,num_of_posts)
    # return list(recent)

@app.route('/api/v1/resources/posts/recent/<int:num_of_posts>',methods=['GET'])
def get_recent_posts(num_of_posts):
    recent = queries.posts_by_time(num_of_posts=num_of_posts)
    return dynamoPosts.nMostRecentPosts(num_of_posts)
    # return list(recent)


@app.route('/api/v1/resources/posts/all', methods=['GET'])
def get_all_posts():
    all_posts = queries.all_posts()
    return dynamoPosts.getAllPosts()
    # return list(all_posts)

@app.route('/api/v1/resources/posts/<int:id>', methods=['GET', 'DELETE'])
def post(id):
    if request.method == 'GET':
        return dynamoPosts.getPost(id)
        # return get_post_by_id(id)
    elif request.method == 'DELETE':
        return dynamoPosts.deletePost(id)
        # return delete_post_by_id(id)

@app.route('/api/v1/resources/posts', methods=['GET', 'POST'])
def posts():
    if request.method == 'GET':
        return filter_posts(request.args)
    elif request.method == 'POST':
        # dynamoPosts.createPost(request.data)
        return create_post(request.data)

def filter_posts(query_parameters):
    id = query_parameters.get('id')
    title = query_parameters.get('title')
    comm = query_parameters.get('community')
    url = query_parameters.get('url')
    username = query_parameters.get('username')
    created_date = query_parameters.get('created_date')

    query = "SELECT * FROM posts WHERE"
    to_filter = []

    if id:
        query += ' id=? AND'
        to_filter.append(id)
    if title:
        query += ' title=? AND'
        to_filter.append(title)
    if comm:
        query += ' comm=? AND'
        to_filter.append(comm)
    if url:
        query += ' url=? AND'
        to_filter.append(url)
    if username:
        query += ' username=? AND'
        to_filter.append(username)
    if created_date:
        query += ' created_date=? AND'
        to_filter.append(created_date)
    if not (id or title or comm or url or username or created_date):
        return page_not_found(404)

    query = query[:-4] + ';'
    results = queries._engine.execute(query, to_filter).fetchall()
    return list(map(dict, results))


def create_post(post):
    required_fields = ['title', 'des', 'comm', 'username']

    if not all([field in post for field in required_fields]):
        raise exceptions.ParseError()
    try:
        if not('url' in post):
            post['url'] = "None"
        day = datetime.datetime.now()
        post['created_date'] = day.strftime("%Y-%m-%d %H:%M:%S")
        post['id'] = queries.create_post(**post)
        votes = {'upvotes':0, 'downvotes':0, 'total':0, 'post':post['id'] }
        votes['id'] = queries.create_vote(**votes)
        dynamoPosts.createPost(post['id'],post['title'],post['comm'],post['username'],post['created_date'],post['url'])
    except Exception as e:
        return { 'error': str(e) }, status.HTTP_409_CONFLICT

    return post, status.HTTP_201_CREATED, {
        'Location': f'/api/v1/resources/posts/{post["id"]}'
    }

def get_post_by_id(id):
    post = queries.post_by_id(id=id)
    if post:
        return post, status.HTTP_200_OK
    return { "error" : f"Post with id {id} not found" }, status.HTTP_404_NOT_FOUND

def delete_post_by_id(id):
    if not id:
        raise exceptions.ParseError()
    try:
        queries.delete_post(id=id)
        return { 'message': f'Deleted post with id {id}' }, status.HTTP_200_OK
    except Exception as e:
        return { 'error': str(e) }, status.HTTP_404_NOT_FOUND

if __name__ == "__main__":
    app.run()
