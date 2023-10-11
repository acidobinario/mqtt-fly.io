FROM eclipse-mosquitto

WORKDIR /app

COPY ./mosquitto.conf /mosquitto/config/
COPY ./entrypoint.sh .

RUN chmod +x entrypoint.sh

EXPOSE 1883

CMD ["sh", "entrypoint.sh"]
