db = db.getSiblingDB('twitterdb');
db.createCollection('twitterMessagesDocker',{capped : true, size : 500000});

