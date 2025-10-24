RUN apt update && apt install -y curl iputils-ping && rm -rf /var/lib/apt/lists/*
COPY ./index.html /usr/share/nginx/html/
COPY ./assets /usr/share/nginx/html/assets
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d/default.conf
CMD ["nginx", "-g", "daemon off;"]
