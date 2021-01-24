#pulls the grpc-server and running it
docker run --name grpc_server -d --rm bmelnik0/grpchello:latest python server.py
sleep 3

#pulling lataset nap image from f5 artifactory and build an image and tag it "bmelnik0/nap" with local conf and policy files
docker build --no-cache -t bmelnik0/nap ./nap/

#run the container from image that was built and name it "app-protect"
docker run --name app-protect  --rm -dit bmelnik0/nap

#Enter the container to show attack logging of the demo
docker exec -it app-protect bash -c "ncat -vlkp 514 | grep --color -e "violations" -e "request_status""