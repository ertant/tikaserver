FROM java:8

COPY . /app
WORKDIR /app
RUN /app/install.sh

EXPOSE 9998
ENTRYPOINT ["java","-jar","tika-server-1.20.jar","-host","0.0.0.0"]



