#!/usr/bin/env python
from __future__ import print_function
import tweepy
import json
from pymongo import MongoClient

MONGO_HOST= 'mongodb:27017'

CONSUMER_KEY = "VTsMr4wVY2uCaJf5Y8SGHhLOk"
CONSUMER_SECRET = "GDatoWbu3akP1C8ZCw9ShwcIZFgaKOQ5pD1LWi8NjWbdkRmt6g"
ACCESS_TOKEN = "1206531229300019201-u1m8qlRyruKp1hC8tGeQAud7LSlgzj"
ACCESS_TOKEN_SECRET = "3zUX38inYV8FlwTBxT8eZNuJdFFMKX8AD7yrE2GvDzcNq"

class StreamListener(tweepy.StreamListener):
    #This is a class provided by tweepy to access the Twitter Streaming API.

    def on_connect(self):
        # Called initially to connect to the Streaming API
        print("You are now connected to the streaming API.")

    def on_error(self, status_code):
        # On error - if an error occurs, display the error / status code
        print('An Error has occured: ' + repr(status_code))
        return False

    def on_data(self, data):
        #This is the meat of the script...it connects to your mongoDB and stores the tweet
        try:
            client = MongoClient(MONGO_HOST)

            # Use twitterdb database. If it doesn't exist, it will be created.
            db = client.twitterdb

            # Decode the JSON from Twitter
            datajson = json.loads(data)

            #grab the 'created_at' data from the Tweet to use for display
            created_at = datajson['created_at']

            #print out a message to the screen that we have collected a tweet
            print("Tweet collected at " + str(created_at))

            #insert the data into the mongoDB into a collection called twitterMessagesDocker
            #if twitterMessagesDocker doesn't exist, it will be created.
            db.twitterMessagesDocker.insert_one(datajson)
        except Exception as e:
           print(e)

auth = tweepy.OAuthHandler(CONSUMER_KEY, CONSUMER_SECRET)
auth.set_access_token(ACCESS_TOKEN, ACCESS_TOKEN_SECRET)
#Set up the listener. The 'wait_on_rate_limit=True' is needed to help with Twitter API rate limiting.
listener = StreamListener()
streamer = tweepy.Stream(auth, listener)
print("Tracking: " + str('docker'))
streamer.filter(track=['docker'])
