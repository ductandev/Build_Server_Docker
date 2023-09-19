FROM node:16

WORKDIR /usr/src/app

COPY package*.json .

# cài node module trên server
RUN yarn install 

COPY prisma ./prisma/

RUN yarn prisma generate

COPY . .

# quy định cứng cho port này bởi docker
EXPOSE 8080             
CMD ["yarn","start"]
# CMD ["node","start"]






# docker build . -t img-html              || img-html: tên image tự đặt trong docker

# docker run -d -p 3030:80 --name cons-html img-html