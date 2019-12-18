#!/usr/bin/env python
from pymongo import MongoClient
from pymongo import CursorType
import time

time.sleep(30)
MONGO_HOST= 'mongodb:27017'
client = MongoClient(MONGO_HOST)
db = client.twitterdb
col = db.twitterMessagesDocker

def get_html_string(l):
    html_str = "<html><h1>usernames</h1><table>"
    for x in l:
        html_str += "<tr><td>" + x + "</td></tr>"
    html_str += "</table></html>"
    return html_str

def usernames_list():
    names = []
    tweets = list(col.find())
    for entry in tweets:
        if "user" in entry:
            names.append(entry["user"]["screen_name"])
    return names

cursor = col.find(cursor_type = CursorType.TAILABLE_AWAIT)
while cursor.alive:
        try:
            html_str = get_html_string(usernames_list())
            with open("usernames.html", "w") as f:
                f.write(html_str)
        except StopIteration:
            time.sleep(1)
