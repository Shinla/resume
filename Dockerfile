FROM nginx:alpine

# Install curl & ping tools for debugging (optional but handy)
RUN apk add --no-cache curl iputils

# Copy website files
COPY ./index.html /usr/share/nginx/html/
COPY ./assets /usr/share/nginx/html/assets

# Replace default Nginx configuration
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose HTTP port
EXPOSE 80

# Run Nginx in foreground
CMD ["nginx", "-g", "daemon off;"]
