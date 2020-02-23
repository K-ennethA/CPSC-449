import flask_api
from flask import request, jsonify
from flask_api import status, exceptions
import pugsql
import os


app = flask_api.FlaskAPI(__name__)
app.config.from_envvar('APP_CONFIG')


queries = pugsql.module('queries/')
queries.connect(app.config['DATABASE_URL'])

@app.cli.command('init')
def init_db():
    with app.app_context():
        db = queries._engine.raw_connection()
        with app.open_resource('posts.sql', mode='r') as f:
            db.cursor().executescript(f.read())
        db.commit()

@app.route('/', methods=['GET'])
def index():
    return 'Welcome to Pizza Hut'


@app.route('/api/v1/resources/posts/all', methods=['GET'])
def get_all_posts():
    all_posts = queries.all_posts()
    return list(all_posts)

@app.route('/api/v1/resources/posts/<int:id>', methods=['GET', 'DELETE'])
def post(id):
    if request.method == 'GET':
        return get_post_by_id(id)
    elif request.method == 'DELETE':
        return delete_post_by_id(id)

@app.route('/api/v1/resources/posts', methods=['GET', 'POST'])
def books():
    if request.method == 'GET':
        pass
        # return filter_books(request.args)
    elif request.method == 'POST':
        return create_post(request.data)


def create_post(post):
    required_fields = ['title', 'des', 'comm', 'username','created_date']

    if not all([field in post for field in required_fields]):
        raise exceptions.ParseError()
    try:
        post['id'] = queries.create_post(**post)
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
