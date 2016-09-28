FROM ubuntu
MAINTAINER Vincent Mizoules

RUN apt-get update && apt-get install -y \
        g++ \
        build-essential \
        make \
        cmake \
        libzzip-dev \
    && echo "Ok"
RUN apt-get install -y \
        dos2unix \
        git \
        subversion \
    && echo "Ok"
RUN apt-get install -y \
        openjdk-8-jre \
        openjdk-8-jdk \
    && echo "Ok"

ADD Readme.txt /Readme.txt

WORKDIR /app
#ENV JAVA_TOOL_OPTIONS -Dfile.encoding=UTF8

CMD ["cat", "/Readme.txt"]