# 'builder' è il nome di quesa fase 
# il cui scopo è fare la build
FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .

RUN npm run build


FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
