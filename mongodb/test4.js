if [ "$MONGO_USERNAME" ] && [ "$MONGO_PASSWORD" ]; then
  "${mongo[@]}" "$MONGO_INITDB_DATABASE" <<-EOJS
  db.createUser({
    user: $(_js_escape "test"),
    pwd: $(_js_escape "test"),
    roles: [ "readWrite", "dbAdmin" ]
   })
  EOJS
fi

