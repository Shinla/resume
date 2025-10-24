# Use lightweight Nginx image
FROM nginx:alpine

# Remove default Nginx config
RUN rm /etc/nginx/conf.d/default.conf

# Copy custom Nginx config
COPY nginx.conf /etc/nginx/conf.d/

# Copy website files
COPY index.html /usr/share/nginx/html/
COPY assets/ /usr/share/nginx/html/assets/

# Copy SSL certificates
COPY ssl/ /etc/nginx/ssl/

# Expose HTTP and HTTPS ports
EXPOSE 80 443

# Start Nginx in foreground
CMD ["nginx", "-g", "daemon off;"]
