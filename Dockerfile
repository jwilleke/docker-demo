FROM nginx:stable-alpine3.19-slim
COPY index.html /usr/share/nginx/html

EXPOSE 80 
CMD ["nginx", "-g", "daemon off;"]