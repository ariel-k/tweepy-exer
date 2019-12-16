db = connect("localhost:27017");
db.createCollection ( "twitterMessagesDocker", {capped : true, size : 500} );
