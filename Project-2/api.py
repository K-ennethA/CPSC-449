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
def init_aws():
    dynamoPosts.createPostsTable()
def delete_aws():
    dynamoPosts.deleteTable()
@app.cli.command('init')
def init_db():
    # dynamoPosts.createPostsTable()
    with app.app_context():
        db = queries._engine.raw_connection()
        with app.open_resource('posts.sql', mode='r') as f:
            db.cursor().executescript(f.read())
        db.commit()

@app.route('/', methods=['GET'])
def index():
    return 'Welcome to Pizza Hut'

if __name__ == "__main__":
    app.run()
