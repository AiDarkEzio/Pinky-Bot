FROM fusuf/whatsasena:latest

RUN git clone https://github.com/AiDarkEzio/Pinky-Bot.git /root/Pinky-Bot
WORKDIR /root/Pinky-Bot/
ENV TZ=Europe/Istanbul
RUN npm install supervisor -g
RUN apk --no-cache --virtual build-dependencies add \
    python \
    make \
    g++ \
    && npm install \
    && apk del build-dependencies
RUN npm install

CMD ["node", "bot.js"]
