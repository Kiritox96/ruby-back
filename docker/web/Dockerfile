
FROM nginx
# Install dependencies
EXPOSE 80
# Use the "exec" form of CMD so Nginx shuts down gracefully on SIGTERM (i.e. `docker stop`)
#COPY --from=builder /frontend-admin/dist/frontend-admin/ /usr/share/nginx/htm
COPY ./nginx.conf /etc/nginx/

ENTRYPOINT nginx -g 'daemon off;'
