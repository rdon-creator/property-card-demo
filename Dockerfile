FROM nginx:alpine
COPY index.html /usr/share/nginx/html/index.html
COPY current-booking.png /usr/share/nginx/html/current-booking.png
COPY current-vrbo.png /usr/share/nginx/html/current-vrbo.png
EXPOSE 8080
CMD sed -i 's/listen       80;/listen       8080;/g' /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'