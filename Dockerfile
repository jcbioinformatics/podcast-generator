FROM ubuntu:latest

RUN apt-get update 

RUN apt-get install -y python3.14
RUN apt-get install -y python3-pip

RUN apt-get install -y git

# Should be alright for temporary use like GitHub actions
# https://stackoverflow.com/a/75722775
RUN pip install PyYAML --break-system-packages

COPY feed.py /usr/bin/feed.py

COPY --chmod=755 entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
