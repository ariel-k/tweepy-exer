if [ "$MONGO_INITDB_ROOT_USERNAME" ] && [ "$MONGO_INITDB_ROOT_PASSWORD" ]; then
  "${mongo[@]}" "$MONGO_INITDB_DATABASE" <<-EOJS
  db.createCollection ( "twitterMessagesDocker", {capped : true, size : 500000} )
EOJS
fi

echo ======================================================
echo created a collection in database $MONGO_INITDB_DATABASE
echo ======================================================

