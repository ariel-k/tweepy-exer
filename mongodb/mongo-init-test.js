var mongo = new Mongo('localhost:27017'); 
mongo.getDB("admin").auth('admin','admin'); 
var db = mongo.getDB('twitter-db');
db.createCollection ( "twitterMessagesDocker", {capped : true, size : 500} );

