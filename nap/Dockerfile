FROM sea-artifactory.olympus.f5net.com/f5-waf_on_nginx-docker/centos/7.4.1708/waf_nginx_r23:latest

RUN ln -sf /dev/stdout /var/log/nginx/access.log \
  && ln -sf /dev/stderr /var/log/nginx/error.log


RUN yum install nmap -y

EXPOSE 50055

COPY nginx.conf /etc/nginx/nginx.conf
COPY custom_grpc_policy.json /etc/nginx/custom_grpc_policy.json
COPY custom_log_format.json /etc/nginx/custom_log_format.json
COPY hello.proto /etc/app_protect/conf/hello.proto
