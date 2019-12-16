db.auth('admin', 'admin');

db = db.getSiblingDB('twitter-db');

db.approver.insert({"email":"some@email.com,"approverType":"APPROVER"});

