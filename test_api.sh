#!/bin/bash
IMAGE_NAME = "test-app"
CONTAINER_NAME = "test-app-container"
docker build -t $IMAGE_NAME
docker run --rn $CONTAINER_NAME
NUM1=5
NUM2=6
RESULT = ((NUM1 + NUM2))
EXPECTED = $(curl -s"http://localhost:5000"&add/?num1=$NUM1&&num2=$NUM2)
if ["RESULT"= "EXPECTED"];then
echo ("success")
exit 0
else
echo ("failure")
exit 1
