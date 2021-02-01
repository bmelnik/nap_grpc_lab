# nap_grpc_lab
grpc lab to demonstrate nap grpc IDL validation feature.

https://docs.f5net.com/pages/viewpage.action?spaceKey=~melnik&title=NAP+gRPC+quick+lab+setup

1. Clone repository
2. Use command "docker run --name grpc_server -d --rm bmelnik0/grpchello:latest python server.py" to pull and run the grpc server.
3. Run "start_nap.sh" in order to initiate deplyment of NAP with provided configuration and policy files.
4. Open new term window.
5. Run "start_grpcurl.sh" to download and untar grpcurl tool for sending grpc traffic.


Docker - NEW
docker run --name grpc_server -d --rm bmelnik0/grpchello:latest python server.py
docker build --no-cache -t bmelnik0/nap .
docker run --name app-protect  --rm -dit bmelnik0/nap
docker exec -it app-protect bash -c "ncat -vlkp 514 | grep --color -e "violations" -e "request_status""


Legit:
./grpcurl -plaintext -H "content-type: application/grpc"  -proto hello.proto -d '{"name": "john"}' 172.17.0.3:50055 hellonerd.HelloNerd/SayHello

Signature:
./grpcurl -plaintext -H "content-type: application/grpc"  -proto hello.proto -d '{"name": "<script>"}' 172.17.0.3:50055 hellonerd.HelloNerd/SayHello

Illegal gRPC method:
./grpcurl -plaintext -H "content-type: application/grpc"  -proto hello2.proto -d '{"name": "john"}' 172.17.0.3:50055 hellonerd.HelloNerd/SayHello2

gRPC data does not comply with format settings:
./grpcurl -plaintext -H "content-type: application/grpc"  -proto hello2.proto -d '{"name": "1234"}' 172.17.0.3:50055 hellonerd.HelloNerd/SayHello

