# stage 1
FROM node:8.11.4 as node
WORKDIR /app

RUN npm i npm@latest -g
RUN npm install -g @angular/cli@7.0.5

COPY . .
RUN npm rebuild node-sass

RUN npm i

RUN ng build

# stage 2
FROM nginx:alpine
COPY --from=node /app/dist /usr/share/nginx/html


# docker run -it --rm  -p 1000:80 -v $(pwd)/dist:/usr/share/nginx/html nginx:alpine sh
# docker run -d  -p 1000:80 -v $(pwd)/dist:/usr/share/nginx/html nginx:alpine
