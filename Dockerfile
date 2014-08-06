FROM dockerfile/elasticsearch

MAINTAINER "Roberto Migli <robertomigli@gmail.com>"

# Get confd
RUN curl -L https://github.com/kelseyhightower/confd/releases/download/v0.6.0-alpha1/confd-0.6.0-alpha1-linux-amd64 -o /confd
RUN chmod +x /confd

# Add files
ADD ./confd /etc/confd
ADD ./bin/run.sh /run.sh
RUN chmod +x /run.sh

ENTRYPOINT ["/run.sh"]
