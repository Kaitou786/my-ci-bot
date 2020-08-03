FROM registry.access.redhat.com/ubi8/ubi

ENV node_version=v12.18.2

RUN yum install xz python3 make -y

RUN curl -L https://nodejs.org/dist/${node_version}/node-${node_version}-linux-x64.tar.xz  -o node-${node_version}-linux-x64.tar.xz && \
    tar -C /root/ -xf node-${node_version}-linux-x64.tar.xz

ENV PATH=/root/node-${node_version}-linux-x64/bin:$PATH

COPY . /kie-github-ci-bot/

WORKDIR /kie-github-ci-bot/ 

RUN npm install

ENTRYPOINT npm start