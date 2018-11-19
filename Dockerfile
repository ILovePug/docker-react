FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
#OPEN port 80 in elastic beanstalk 
EXPOSE 80 

#copy the final build to nginx public facing folder
COPY --from=builder /app/build /usr/share/nginx/html
