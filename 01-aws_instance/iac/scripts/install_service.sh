#! /bin/bash

echo "Hello world" > index.html 
nohup busybox httpd -f -p 8080 & 