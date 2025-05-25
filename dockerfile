FROM nginx:alpine

# Clean the default NGINX html directory
RUN rm -rf /usr/share/nginx/html/*

# Copy local files into the NGINX html directory
COPY . /usr/share/nginx/html*

# Expose port 80 for HTTP traffic
EXPOSE 80
