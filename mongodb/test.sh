if [ "$MONGO_INITDB_ROOT_USERNAME" ] && [ "$MONGO_INITDB_ROOT_PASSWORD" ]; then
  mongo -- "$MONGO_INITDB_DATABASE" <<EOF
  db = db.getSiblingDB('twitter-db');
  db.auth('admin','admin')
  db.createCollection ( "twitterMessagesDocker", {capped : true, size : 500} )
EOF
fi

echo ======================================================
echo created a collection in database $MONGO_INITDB_DATABASE
echo ======================================================

