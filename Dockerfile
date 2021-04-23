FROM node:10 as builder
WORKDIR /app

COPY . .
RUN npm install
RUN npm run build

FROM nginx:mainline-alpine
COPY ./nginx-http.conf /etc/nginx/conf.d/default.conf

COPY --from=builder /app/dist /usr/share/nginx/html
