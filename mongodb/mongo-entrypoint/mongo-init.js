db = db.getSiblingDB('twitter-db');
db.createCollection('twitterMessagesDocker',{capped : true, size : 500});

