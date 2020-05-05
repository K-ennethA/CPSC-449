import flask_api
from flask import request, Response
import requests
from requests.exceptions import HTTPError
from feedgen.feed import FeedGenerator
from datetime import datetime, timedelta
from math import log

#search Github's repositories for requests
app = flask_api.FlaskAPI(__name__)

#The 25 most recent posts for any community
@app.route('/api/rss/resources/posts/recent/<int:num_of_posts>',methods=['GET'])
def get_25_recent_post_any_comm(num_of_posts):
    try:
        response = requests.get('http://localhost:5000/api/v1/resources/posts/recent/{}'.format(num_of_posts),)
        # If the response was successful, no Exception will be raised
        response.raise_for_status()
    
    except HTTPError as http_err:
        print(f'HTTP error occurred: {http_err}')  # Python 3.6
    except Exception as err:
        print(f'Other error occurred: {err}')  # Python 3.6
    else:
        print('Success!')

    #Inspect some attributes of the `requests` repository
    json_response = response.json()

    #createing a feed for the 25 most recent posts of any community
    fg = FeedGenerator()
    fg.id('http://localhost:5200/api/rss/resources/posts/recent/{}'.format(num_of_posts))
    fg.title('25 most recent posts of any comminity')
    fg.subtitle('Reddit')
    fg.language('en')
    fg.link(href='reddit.com')

    #Add Feed Entries for all 25 posts
    for post in json_response:
        fe = fg.add_entry()
        #fe.id(str(post['id']))
        fe.title(post['title'])
        fe.author({'name':post['username']})
        fe.pubDate(post['date']+'-7:00')
        
    #Generate the Feed
    rssfeed = fg.rss_str(pretty=True)
    rssfeed = rssfeed.decode() #changes type bytes to type string 
    return  Response(rssfeed, mimetype='rss+xml') #changes the Content-Type of the application to rss+xml

#get 25 most recent posts to a particular community
@app.route('/api/rss/resources/posts/<string:comm>/<int:num_of_posts>',methods=['GET'])
def get_25_recent_post_part_comm(comm,num_of_posts):
    try:
        response = requests.get('http://localhost:5000/api/v1/resources/posts/{}/{}'.format(comm,num_of_posts),)
        # If the response was successful, no Exception will be raised
        response.raise_for_status()
    
    except HTTPError as http_err:
        print(f'HTTP error occurred: {http_err}')  # Python 3.6
    except Exception as err:
        print(f'Other error occurred: {err}')  # Python 3.6
    else:
        print('Success!')

    #Inspect some attributes of the `requests` repository
    json_response = response.json()

    #createing a feed for the 25 most recent posts of a particular community
    fg = FeedGenerator()
    fg.id('http://localhost:5200/api/rss/resources/posts/{}/{}'.format(comm,num_of_posts))
    fg.title('25 most recent posts for a particular comminity')
    fg.subtitle('Reddit')
    fg.language('en')
    fg.link(href='reddit.com')    
    
    #Add Feed Entries for all 25 posts
    for post in json_response:
        fe = fg.add_entry()
        # fe.id(str(post['id']))
        fe.title(post['title'])
        fe.author({'name':post['username']})
        fe.pubDate(post['date']+'-7:00')

    #Generate the Feed
    rssfeed = fg.rss_str(pretty=True)
    rssfeed = rssfeed.decode() #changes type bytes to type string 
    return  Response(rssfeed, mimetype='rss+xml') #changes the Content-Type of the application to rss+xml

#The top 25 posts to any community, sorted by score
@app.route('/api/rss/resources/posts/top/<int:num_of_posts>',methods=['GET'])
def get_top_25_post_any_comm(num_of_posts):
    try:
        response = requests.get('http://localhost:5100/api/v1/resources/votes/top/{}'.format(num_of_posts),) #return the top 25
        # If the response was successful, no Exception will be raised
        response.raise_for_status()
    
    except HTTPError as http_err:
        print(f'HTTP error occurred: {http_err}')  # Python 3.6
    except Exception as err:
        print(f'Other error occurred: {err}')  # Python 3.6
    else:
        print('Success!')

    #Inspect some attributes of the `requests` repository
    votes_json_response = response.json()
    post_ids = [] # create a list of post ids to be sorted
    for vote in votes_json_response:
        post_ids.append(vote['PostID'])
    
    #sort the list of ids with the post request
    sorted_votes = requests.post('http://localhost:5100/api/v1/resources/votes/list', data = {'list':str(post_ids)})
    sorted_votes_json_response = sorted_votes.json()

    #The top 25 posts to a particular community, sorted by score
    fg = FeedGenerator()
    fg.id('http:localhost:5200/api/rss/resources/posts/{}'.format(num_of_posts))
    fg.title('The top 25 posts to any community, sorted by score')
    fg.subtitle('Reddit')
    fg.language('en')
    fg.link(href='reddit.com')

    for vote in sorted_votes_json_response:
        response = requests.get('http://localhost:5000/api/v1/resources/posts/{}'.format(vote['PostID'])) #given the id of the votes find the corresponding post
        #Add Feed Entries for all 25 posts
        post_response = response.json()
        fe = fg.add_entry()
        fe.id(str(vote['PostID']))
        fe.title(post_response['title'])
        fe.author({'name':post_response['username']})
        fe.pubDate(post_response['date']+'-7:00')

    #Generate the Feed
    rssfeed = fg.rss_str(pretty=True)
    rssfeed = rssfeed.decode() #changes type bytes to type string 
    return  Response(rssfeed, mimetype='rss+xml') #changes the Content-Type of the application to rss+xml   

#The top 25 posts to a particular community, sorted by score
@app.route('/api/rss/resources/posts/top/<string:comm>/<int:num_of_posts>',methods=['GET'])
def get_top_25_recent_post_part_comm(comm,num_of_posts):
    try:
        response = requests.get('http://localhost:5100/api/v1/resources/votes/top/{}'.format(num_of_posts),) #return the top 25
        # If the response was successful, no Exception will be raised
        response.raise_for_status()
    
    except HTTPError as http_err:
        print(f'HTTP error occurred: {http_err}')  # Python 3.6
    except Exception as err:
        print(f'Other error occurred: {err}')  # Python 3.6
    else:
        print('Success!')

    #Inspect some attributes of the `requests` repository
    votes_json_response = response.json()
    post_ids = [] #create a list of ids to be later sorted
    for vote in votes_json_response:
        post_ids.append(vote['PostID'])
        print(vote)
    #sort the list of post ids with the post request to the given local host 
    sorted_votes = requests.post('http://localhost:5100/api/v1/resources/votes/list', data = {'list':str(post_ids)})
    sorted_votes_json_response = sorted_votes.json()
   
    #The top 25 posts to a particular community, sorted by score
    fg = FeedGenerator()
    fg.id('http://localhost:5200/api/rss/resources/posts/{}/{}'.format(comm,num_of_posts))
    fg.title('25 most recent posts for a particular comminity')
    fg.subtitle('Reddit')
    fg.language('en')
    fg.link(href='reddit.com')

    for vote in sorted_votes_json_response:
        try:
            response = requests.get('http://localhost:5000/api/v1/resources/posts/{}'.format(vote['PostID']),) #given the id of the votes find the corresponding post
            #Add Feed Entries for all 25 posts
            # If the response was successful, no Exception will be raised
            response.raise_for_status()
        except HTTPError as http_err:
            print(f'HTTP error occurred: {http_err}')  # Python 3.6
        except Exception as err:
            print(f'Other error occurred: {err}')  # Python 3.6
        else:
            print('Success!')

        post_response = response.json()
        if post_response['subreddit']==comm: #filter by a particular community
            fe = fg.add_entry()
            fe.id(str(vote['PostID']))
            fe.title(post_response['title'])
            fe.author({'name':post_response['username']})
            fe.pubDate(post_response['date']+'-7:00')

    #Generate the Feed
    rssfeed = fg.rss_str(pretty=True)
    rssfeed = rssfeed.decode() #changes type bytes to type string 
    return  Response(rssfeed, mimetype='rss+xml') #changes the Content-Type of the application to rss+xml  

#The hot 25 posts to any community, ranked using Reddit’s “hot ranking” algorithm.
@app.route('/api/rss/resources/posts/hot/<int:num_of_posts>',methods=['GET'])
def get_hot_25_post_any_comm(num_of_posts):
    hot_list =[] #list of the hot posts
    try:
        response = requests.get('http://localhost:5100/api/v1/resources/votes/top/{}'.format(num_of_posts),) #return the top 25
        response.raise_for_status() # If the response was successful, no Exception will be raised 
    except HTTPError as http_err:
        print(f'HTTP error occurred: {http_err}')  # Python 3.6
    except Exception as err:
        print(f'Other error occurred: {err}')  # Python 3.6
    else:
        print('Success!')

    #Inspect some attributes of the `requests` repository
    votes_json_response = response.json()

    #The top 25 posts to a particular community 
    fg = FeedGenerator()
    fg.id('http://localhost:5100/api/rss/resources/posts/{}'.format(num_of_posts))
    fg.title('25 most recent posts for a particular comminity')
    fg.subtitle('Reddit')
    fg.language('en')
    fg.link(href='reddit.com')

    for vote in votes_json_response: 
        post = {} #create a dictionary of ids and hot rank
        try:

            #given the id of the votes find the corresponding upvote and downvote
            up_down_vote_response = requests.get('http://localhost:5100/api/v1/resources/votes/{}'.format(vote['PostID']),)  
            #give the vote id find the corresponding post 
            post_response = requests.get('http://localhost:5000/api/v1/resources/posts/{}'.format(vote['PostID']),) 
            response.raise_for_status() # If the response was successful, no Exception will be raised 

        except HTTPError as http_err:
            print(f'HTTP error occurred: {http_err}')  # Python 3.6
        except Exception as err:
            print(f'Other error occurred: {err}')  # Python 3.6
        else:
            print('Success!')

        #create json responses for the following get requests 
        up_down_vote_json_res= up_down_vote_response.json()
        post_json_response  = post_response.json() 

        #save the upvote and downvote so they can be used to calculate the hot rank
        upvote = up_down_vote_json_res['upvotes']
        downvote = up_down_vote_json_res['downvotes']

        json_date= str(post_json_response['date']).split(' ')[0].split('-')
        json_time = str(post_json_response['date']).split(' ')[1].split(':')

        epoch = datetime(1970,1,1)  
        date = datetime(int(json_date[0]), int(json_date[1]), int(json_date[2]), int(json_time[0]), int(json_time[1]),int(json_time[2]))
        
        def epoch_seconds(date):
            td = date - epoch
            return td.days * 86400 + td.seconds + (float(td.microseconds) / 1000000)

        def score(upvote, downvote):
            return upvote - downvote
        #hot ranking 
        s = score(upvote, downvote)
        order = log(max(abs(s), 1), 10)
        sign = 1 if s > 0 else -1 if s < 0 else 0
        seconds = epoch_seconds(date) - 1134028003
        post['id'] = vote['PostID'] 
        post['rank'] = round(sign * order + seconds / 45000, 7)
        hot_list.append(post)
    #sort the list 
    sorted_hot_list = sorted(hot_list,key = lambda i: i['rank'] )
    #grab the first 25 hot rankings and add it to the rss feed
    for post in sorted_hot_list[:26]:
        fe = fg.add_entry()
        fe.id(str(vote['PostID']))
        fe.title(post_json_response['title'])
        fe.author({'name':post_json_response['username']})
        fe.pubDate(post_json_response['date']+'-7:00')

    
    #Generate the Feed
    rssfeed = fg.rss_str(pretty=True)
    rssfeed = rssfeed.decode() #changes type bytes to type string 
    return  Response(rssfeed, mimetype='rss+xml') #changes the Content-Type of the application to rss+xml  

if __name__ == "__main__":
    app.run()