FROM node:18 AS build
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build


FROM nginx:alpine
COPY --from=build /app/dist/sistema-grupo-brasileiro/browser /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf
COPY mime.types /etc/nginx/mime.types
EXPOSE 4000
CMD ["nginx", "-g", "daemon off;"]


