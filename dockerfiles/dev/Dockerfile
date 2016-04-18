FROM ubuntu
MAINTAINER Vincent Mizoules

RUN apt-get update && apt-get install -y \
        g++ \
        build-essential \
        make \
        libzzip-dev \
        openjdk-7-jre \
        openjdk-7-jdk \
    && echo "Ok"
RUN apt-get update && apt-get install -y \
        dos2unix \
    && echo "Ok"

ADD Readme.txt /Readme.txt

WORKDIR /app
#ENV JAVA_TOOL_OPTIONS -Dfile.encoding=UTF8

CMD ["cat", "/Readme.txt"]