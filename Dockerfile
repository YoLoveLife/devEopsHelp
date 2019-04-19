FROM python:3.6-alpine
MAINTAINER Yo YoLoveLife@outlook.com
RUN echo "https://mirrors.aliyun.com/alpine/v3.9/main/" > /etc/apk/repositories \
        && apk update \
        && apk add libffi libffi-dev openldap-dev
RUN mkdir -p /app
COPY ./ /app/
COPY pip.conf /root/.pip/pip.conf
RUN pip install -r /app/requirements.txt
WORKDIR /app
EXPOSE 8000
CMD [ "sh", "./init.sh"]
