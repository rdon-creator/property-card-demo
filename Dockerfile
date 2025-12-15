FROM nginx:alpine
COPY index.html /usr/share/nginx/html/index.html
COPY current-booking.png /usr/share/nginx/html/current-booking.png
COPY current-vrbo.png /usr/share/nginx/html/current-vrbo.png
COPY travelai-qbr.png /usr/share/nginx/html/travelai-qbr.png
COPY ["RP Kayak.com.png", "/usr/share/nginx/html/RP Kayak.com.png"]
COPY ["RP Vacationrenter.com.png", "/usr/share/nginx/html/RP Vacationrenter.com.png"]
COPY ["RP kayak.com mobile iphone 14.png", "/usr/share/nginx/html/RP kayak.com mobile iphone 14.png"]
COPY ["RP vacationrenter.com mobile iphone 14.png", "/usr/share/nginx/html/RP vacationrenter.com mobile iphone 14.png"]
EXPOSE 8080
CMD sed -i 's/listen       80;/listen       8080;/g' /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'