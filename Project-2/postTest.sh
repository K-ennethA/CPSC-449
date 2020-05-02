#!/bin/bash

#created 8 posts
curl --verbose \
     --request POST \
     --header 'Content-Type: application/json' \
     --data '{
       "title": "New Star Wars When???",
       "des": "some description1",
       "comm":"StarWars",
       "username":"BigStarWarsFan"
     }' \
    http://localhost:5000/api/v1/resources/posts
sleep 1
curl --verbose \
     --request POST \
     --header 'Content-Type: application/json' \
     --data '{
       "title": "If I am the father do I have to pay past child support?",
       "des": "some description2",
       "comm":"StarWars",
       "username":"Darth Vader"
     }' \
    http://localhost:5000/api/v1/resources/posts
sleep 1

curl --verbose \
     --request POST \
     --header 'Content-Type: application/json' \
     --data '{
       "title": "Reconnecting with father advice",
       "des": "some description3",
       "comm":"StarWars",
       "username":"Luke Skywalker"
     }' \
    http://localhost:5000/api/v1/resources/posts
sleep 1

curl --verbose \
     --request POST \
     --header 'Content-Type: application/json' \
     --data '{
       "title": "Does anyone else think the sith lord and chancellor look the same",
       "des": "some description4",
       "comm":"StarWars",
       "username":"Clone trooper 5s"
     }' \
    http://localhost:5000/api/v1/resources/posts
sleep 1

curl --verbose \
     --request POST \
     --header 'Content-Type: application/json' \
     --data '{
       "title": "Looking for work Post Death Star",
       "des": "some description5",
       "comm":"StarWars",
       "username":"Storm Trooper"
     }' \
    http://localhost:5000/api/v1/resources/posts
sleep 1

curl --verbose \
     --request POST \
     --header 'Content-Type: application/json' \
     --data '{
       "title": "Hnn Hnn",
       "des": "some description6",
       "comm":"StarWars",
       "username":"Sand People 5s"
     }' \
    http://localhost:5000/api/v1/resources/posts
sleep 1

curl --verbose \
     --request POST \
     --header 'Content-Type: application/json' \
     --data '{
       "title": "RAWRWARRGG",
       "des": "some description7",
       "comm":"StarWars",
       "username":"Chewie"
     }' \
    http://localhost:5000/api/v1/resources/posts
sleep 1

curl --verbose \
     --request POST \
     --header 'Content-Type: application/json' \
     --data '{
       "title": "I know",
       "des": "some description8",
       "comm":"StarWars",
       "username":"Han Solo",
       "url" : "Starwarsfanpage.com"
     }' \
    http://localhost:5000/api/v1/resources/posts
sleep 1

curl --verbose \
     --request POST \
     --header 'Content-Type: application/json' \
     --data '{
       "title": "I love you",
       "des": "some description9",
       "comm":"StarWars",
       "username":"Leia",
       "url" : "Starwarsfanpage.com"
     }' \
    http://localhost:5000/api/v1/resources/posts
sleep 1

curl --verbose \
     --request POST \
     --header 'Content-Type: application/json' \
     --data '{
       "title": "Take a seat skywalker",
       "des": "some description10",
       "comm":"StarWars",
       "username":"Mace Windu",
       "url" : "Starwarsfanpage.com"
     }' \
    http://localhost:5000/api/v1/resources/posts

sleep 1

curl --verbose \
     --request POST \
     --header 'Content-Type: application/json' \
     --data '{
       "title": "May the Force be with you",
       "des": "some description11",
       "comm":"StarWars",
       "username":"Skyguy",
       "url" : "Starwarsfanpage.com"
     }' \
    http://localhost:5000/api/v1/resources/posts
sleep 1

curl --verbose \
     --request POST \
     --header 'Content-Type: application/json' \
     --data '{
       "title": "Do or do not there is no try",
       "des": "some description12",
       "comm":"StarWars",
       "username":"YODA",
       "url" : "Starwarsfanpage.com"
     }' \
    http://localhost:5000/api/v1/resources/posts
sleep 1

curl --verbose \
     --request POST \
     --header 'Content-Type: application/json' \
     --data '{
       "title": "Star Trek is better",
       "des": "some description13",
       "comm":"StarWars",
       "username":"disgruntled star trek fan",
       "url" : "starwarstakesawayfromthetrek.com"
     }' \
    http://localhost:5000/api/v1/resources/posts
sleep 1

curl --verbose \
     --request POST \
     --header 'Content-Type: application/json' \
     --data '{
       "title": "Does anyone else think disney ruined star wars",
       "des": "some description14",
       "comm":"StarWars",
       "username":"disgruntled star wars fan",
       "url" : "georgelucas.com"
     }' \
    http://localhost:5000/api/v1/resources/posts
sleep 1

curl --verbose \
     --request POST \
     --header 'Content-Type: application/json' \
     --data '{
       "title": "Ahsoka is an amazing character",
       "des": "some description15",
       "comm":"StarWars",
       "username":"Rex",
       "url" : "starwars.com"
     }' \
    http://localhost:5000/api/v1/resources/posts
sleep 1

curl --verbose \
     --request POST \
     --header 'Content-Type: application/json' \
     --data '{
       "title": "Anakin is the chosen one",
       "des": "some description16",
       "comm":"StarWars",
       "username":"qui gon",
       "url" : "starwars.com"
     }' \
    http://localhost:5000/api/v1/resources/posts
sleep 1

curl --verbose \
     --request POST \
     --header 'Content-Type: application/json' \
     --data '{
       "title": "Qui Gon Really Gone",
       "des": "some description17",
       "comm":"StarWars",
       "username":"Yoda",
       "url" : "starwars.com"
     }' \
    http://localhost:5000/api/v1/resources/posts
sleep 1

curl --verbose \
     --request POST \
     --header 'Content-Type: application/json' \
     --data '{
       "title": "Obi Wan is the Only one for me",
       "des": "some description18",
       "comm":"StarWars",
       "username":"obifans",
       "url" : "starwars.com"
     }' \
    http://localhost:5000/api/v1/resources/posts
sleep 1

curl --verbose \
     --request POST \
     --header 'Content-Type: application/json' \
     --data '{
       "title": "HELLO THERE",
       "des": "some description19",
       "comm":"StarWars",
       "username":"OBI Wan",
       "url" : "starwars.com"
     }' \
    http://localhost:5000/api/v1/resources/posts
sleep 1

curl --verbose \
     --request POST \
     --header 'Content-Type: application/json' \
     --data '{
       "title": "KENOBI You are a bold one",
       "des": "some description20",
       "comm":"StarWars",
       "username":"Grievous",
       "url" : "starwars.com"
     }' \
    http://localhost:5000/api/v1/resources/posts
sleep 1

curl --verbose \
     --request POST \
     --header 'Content-Type: application/json' \
     --data '{
       "title": "I was expecting Kenobi why are you here?",
       "des": "some description21",
       "comm":"StarWars",
       "username":"Darth Maul",
       "url" : "starwars.com"
     }' \
    http://localhost:5000/api/v1/resources/posts
sleep 1

curl --verbose \
     --request POST \
     --header 'Content-Type: application/json' \
     --data '{
       "title": "My powers have doubled since the last time",
       "des": "some description22",
       "comm":"StarWars",
       "username":"Anakin",
       "url" : "starwars.com"
     }' \
    http://localhost:5000/api/v1/resources/posts
sleep 1

curl --verbose \
     --request POST \
     --header 'Content-Type: application/json' \
     --data '{
       "title": "Good twice the pride double the fall",
       "des": "some description23",
       "comm":"StarWars",
       "username":"Dooku",
       "url" : "starwars.com"
     }' \
    http://localhost:5000/api/v1/resources/posts
sleep 1

curl --verbose \
     --request POST \
     --header 'Content-Type: application/json' \
     --data '{
       "title": "Dead sub or what?",
       "des": "some description24",
       "comm":"StarWars",
       "username":"Darth Maul",
       "url" : "starwars.com"
     }' \
    http://localhost:5000/api/v1/resources/posts
sleep 1

curl --verbose \
     --request POST \
     --header 'Content-Type: application/json' \
     --data '{
       "title": "Arent you a little short for a stromtrooper",
       "des": "some description25",
       "comm":"StarWars",
       "username":"Storm Trooper2727",
       "url" : "starwars.com"
     }' \
    http://localhost:5000/api/v1/resources/posts
sleep 1
curl --verbose \
     --request POST \
     --header 'Content-Type: application/json' \
     --data '{
       "title": "I made a table",
       "des": "some description26",
       "comm":"Woodworking",
       "username":"Ron Swanson"
     }' \
    http://localhost:5000/api/v1/resources/posts
sleep 1

curl --verbose \
     --request POST \
     --header 'Content-Type: application/json' \
     --data '{
       "title": "Cute Dog",
       "des": "some description27",
       "comm":"Aww",
       "username":"Dog lovers"
     }' \
    http://localhost:5000/api/v1/resources/posts
sleep 1

curl --verbose \
     --request POST \
     --header 'Content-Type: application/json' \
     --data '{
       "title": "I made a chair",
       "des": "some description28",
       "comm":"Woodworking",
       "username":"WoodGUY"
     }' \
    http://localhost:5000/api/v1/resources/posts

sleep 1

curl --verbose \
     --request POST \
     --header 'Content-Type: application/json' \
     --data '{
       "title": "Hey all you cats and kittens",
       "des": "some description29",
       "comm":"Netflix",
       "username":"Carol Baskin"
     }' \
    http://localhost:5000/api/v1/resources/posts
sleep 1

curl --verbose \
     --request POST \
     --header 'Content-Type: application/json' \
     --data '{
       "title": "That ***** carole baskin killed her husband",
       "des": "some description30",
       "comm":"Netflix",
       "username":"Exotic Joe"
     }' \
    http://localhost:5000/api/v1/resources/posts
sleep 1

curl --verbose \
     --request POST \
     --header 'Content-Type: application/json' \
     --data '{
       "title": "We need to focus on the tigers",
       "des": "some description31",
       "comm":"Netflix",
       "username":"Animal lover"
     }' \
    http://localhost:5000/api/v1/resources/posts
sleep 1

curl --verbose \
     --request POST \
     --header 'Content-Type: application/json' \
     --data '{
       "title": "Here is my doggo",
       "des": "some description32",
       "comm":"Aww",
       "username":"IONLYTAKEPICTURESOFMYDOG",
       "url" : "doggpics.com"
     }' \
    http://localhost:5000/api/v1/resources/posts
sleep 1

curl --verbose \
     --request POST \
     --header 'Content-Type: application/json' \
     --data '{
       "title": "Weird animal you probably shouldnt own",
       "des": "some description33",
       "comm":"Aww",
       "username":"Exotic Joe"
     }' \
    http://localhost:5000/api/v1/resources/posts
sleep 1



curl --verbose \
     --request POST \
     --header 'Content-Type: application/json' \
     --data '{
       "title": "Is anyone else over quaratine",
       "des": "some description35",
       "comm":"CoronaVirus",
       "username":"SomeKidxxx"
     }' \
    http://localhost:5000/api/v1/resources/posts
sleep 1

curl --verbose \
     --request POST \
     --header 'Content-Type: application/json' \
     --data '{
       "title": "Did anyone see that HB was packed",
       "des": "some description36",
       "comm":"CoronaVirus",
       "username":"concerned"
     }' \
    http://localhost:5000/api/v1/resources/posts
sleep 1

curl --verbose \
     --request POST \
     --header 'Content-Type: application/json' \
     --data '{
       "title": "Can anyone help me on my backend project",
       "des": "some description34",
       "comm":"Computer Science",
       "username":"Confused student"
     }' \
    http://localhost:5000/api/v1/resources/posts
sleep 1

curl --verbose \
     --request POST \
     --header 'Content-Type: application/json' \
     --data '{
       "title": "Theres a pandemic?",
       "des": "some description37",
       "comm":"CoronaVirus",
       "username":"Slowpoke Gamer"
     }' \
    http://localhost:5000/api/v1/resources/posts
sleep 1


#delete posts with id's 2 and 6
curl --verbose \
     --request DELETE \
    http://localhost:5000/api/v1/resources/posts/2

curl --verbose \
     --request DELETE \
    http://localhost:5000/api/v1/resources/posts/6

#gety post with id 4
curl --verbose \
     --request GET \
    http://localhost:5000/api/v1/resources/posts/4

# get 2 most recent posts from community 449
curl --verbose \
     --request GET \
    http://localhost:5000/api/v1/resources/posts/StarWars/2

# get 3 recent posts from any community
curl --verbose \
     --request GET \
    http://localhost:5000/api/v1/resources/posts/recent/3
