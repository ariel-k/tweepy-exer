#!/usr/bin/env bash
mongo admin --host localhost -u admin -p admin --eval "createCollection('twitterMessagesDocker',{capped : true, size : 500})"
