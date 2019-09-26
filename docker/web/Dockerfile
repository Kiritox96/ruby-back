
FROM nginx
# Install dependencies
EXPOSE 80
# Use the "exec" form of CMD so Nginx shuts down gracefully on SIGTERM (i.e. `docker stop`)
ENTRYPOINT nginx -g 'daemon off;'
