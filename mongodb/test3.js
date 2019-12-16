if [ "$MONGO_INITDB_ROOT_USERNAME" ] && [ "$MONGO_INITDB_ROOT_PASSWORD" ]; then
  rootAuthDatabase='admin'
  "${mongo[@]}" "$rootAuthDatabase" <<-EOJS
  db.createCollection ( "twitterMessagesDocker", {capped : true, size : 500} )  
  EOJS
fi

