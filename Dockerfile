FROM mono:latest

COPY src /tmp/src
COPY ./run_xsp4.sh /usr/local/bin/

RUN mono --version
RUN (apt-get update; apt-get install -y mono-xsp4 nuget)
RUN (cd /tmp/src; nuget restore; msbuild)
ENTRYPOINT ["run_xsp4.sh"]
