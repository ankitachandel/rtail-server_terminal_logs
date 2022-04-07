FROM node

MAINTAINER Ankita Chandel <ankita@gmail.com>

ENV RTAIL_SERVER_PORT_WEB=8181
ENV RTAIL_SERVER_PORT_UDP=9191
ENV RTAIL_LISTEN_IP=0.0.0.0

EXPOSE ${RTAIL_SERVER_PORT_WEB} ${RTAIL_SERVER_PORT_UDP} 8182 9192

RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends netcat
RUN apt-get clean && rm -rf /var/cache/apt/* /var/lib/apt/lists/* 
RUN npm install -g npm@8.5.5
RUN npm install rtail -g

CMD rtail-server --wh ${RTAIL_LISTEN_IP} --wp ${RTAIL_SERVER_PORT_WEB} --uh ${RTAIL_LISTEN_IP} --up ${RTAIL_SERVER_PORT_UDP}

