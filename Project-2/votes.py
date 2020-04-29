import flask_api
from flask import request, jsonify
from flask_api import status, exceptions
import datetime
import pugsql
import os
import datetime


app = flask_api.FlaskAPI(__name__)
app.config.from_envvar('APP_CONFIG')


queries = pugsql.module('queries/')
queries.connect(app.config['DATABASE_URL'])

@app.route('/', methods=['GET'])
def index():
    return list_posts([8,9])

@app.route('/api/v1/resources/votes/all', methods=['GET'])
def votes():
    all_votes = queries.all_votes()
    return list(all_votes)

@app.route('/api/v1/resources/votes/upvote/<int:id>', methods=['GET', 'POST'])
def upvote(id):
    post = queries.post_by_id(id=id)
    if post:
        queries.upvote_post(post=id)
        return { 'message': f'upvoted post with id {id}'}, status.HTTP_200_OK
    return { "error" : f"Post with id {id} not found" }, status.HTTP_404_NOT_FOUND

@app.route('/api/v1/resources/votes/downvote/<int:id>', methods=['GET', 'POST'])
def downvote(id):
    post = queries.post_by_id(id=id)
    if post:
        queries.downvote_post(post=id)
        return {'message': f'downvoted post with id {id}'}, status.HTTP_200_OK
    return {"error" : f"Post with id {id} not found"}, status.HTTP_404_NOT_FOUND

@app.route('/api/v1/resources/votes/<int:id>', methods=['GET'])
def get_votes_by_id(id):
    post = queries.post_by_id(id=id)
    if post:
        post = queries.votes_by_post_id(post=id)
        return post, status.HTTP_200_OK
    return {'message': f'post with id {id} not found'}, status.HTTP_404_NOT_FOUND

#n top scoring by community (accidentally read the promt wrong first time)
@app.route('/api/v1/resources/votes/<string:comm>/<int:num_of_posts>',methods=['GET'])
def get_votes_by_comm(comm,num_of_posts):
    posts = queries.votes_by_comm(comm=comm,num_of_posts=num_of_posts)
    return list(posts)

#n top scoring posts despite community 
@app.route('/api/v1/resources/votes/top/<int:num_of_posts>',methods=['GET'])
def n_top_scoring_posts(num_of_posts):
    posts = queries.n_top_scoring(num_of_posts=num_of_posts)
    return list(posts)

@app.route('/api/v1/resources/votes/list', methods=['POST'])
def list_posts():
    to_filter = list(request.form.get('list'))
    to_filter = parse(to_filter)

    query = "SELECT posts.id,posts.title,posts.comm,posts.username,posts.created_date,votes.total FROM posts INNER JOIN votes ON posts.id=votes.post WHERE posts.id IN ("
    #add as many ? we need to filter
    for i in to_filter:
        query = query + "?,"

    query = query[:-1] + ") ORDER BY votes.total DESC;"
    results = queries._engine.execute(query, to_filter).fetchall()

    return list(map(dict, results))

def parse(arr):
    #arr gets passed in format [ '[', '1', '4', ',', '6', ']' ]
    temp = ""
    for i in arr:
        if i.isdigit():
             temp = temp + i
        elif i == ",":
            temp = temp + ", "
    #split string into a list of string digits
    parsed = temp.split(", ")
    #return the example as [ '14', '6']
    return parsed

if __name__ == "__main__":
    app.run()
