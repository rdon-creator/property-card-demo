FROM nginx:alpine
COPY index.html /usr/share/nginx/html/index.html
COPY current-booking.png /usr/share/nginx/html/current-booking.png
COPY current-vrbo.png /usr/share/nginx/html/current-vrbo.png
COPY travelai-qbr.png /usr/share/nginx/html/travelai-qbr.png

# Existing competitors
COPY ["RP Kayak.com.png", "/usr/share/nginx/html/RP Kayak.com.png"]
COPY ["RP Vacationrenter.com.png", "/usr/share/nginx/html/RP Vacationrenter.com.png"]
COPY ["RP kayak.com mobile iphone 14.png", "/usr/share/nginx/html/RP kayak.com mobile iphone 14.png"]
COPY ["RP vacationrenter.com mobile iphone 14.png", "/usr/share/nginx/html/RP vacationrenter.com mobile iphone 14.png"]

# New competitors
COPY ["RP agoda.png", "/usr/share/nginx/html/RP agoda.png"]
COPY ["RP airbnb.png", "/usr/share/nginx/html/RP airbnb.png"]
COPY ["RP airbnb mobile iphone 14.png", "/usr/share/nginx/html/RP airbnb mobile iphone 14.png"]
COPY ["RP airbnb 2 mobile iphone 14.png", "/usr/share/nginx/html/RP airbnb 2 mobile iphone 14.png"]
COPY ["RP booking.com.png", "/usr/share/nginx/html/RP booking.com.png"]
COPY ["RP cozycozy.png", "/usr/share/nginx/html/RP cozycozy.png"]
COPY ["RP hometogo.png", "/usr/share/nginx/html/RP hometogo.png"]
COPY ["RP onefinestay.com.png", "/usr/share/nginx/html/RP onefinestay.com.png"]
COPY ["RP onefinestay.com mobile iphone 14.png", "/usr/share/nginx/html/RP onefinestay.com mobile iphone 14.png"]
COPY ["RP tripadvisor.png", "/usr/share/nginx/html/RP tripadvisor.png"]
COPY ["RP tripadvisor mobile iphone 14.png", "/usr/share/nginx/html/RP tripadvisor mobile iphone 14.png"]
COPY ["RP tripadvisor 2 mobile iphone 14.png", "/usr/share/nginx/html/RP tripadvisor 2 mobile iphone 14.png"]
COPY ["RP vrbo.png", "/usr/share/nginx/html/RP vrbo.png"]
COPY ["RP RBO.png", "/usr/share/nginx/html/RP RBO.png"]
COPY ["RP RBO mobile iphone 14.png", "/usr/share/nginx/html/RP RBO mobile iphone 14.png"]

EXPOSE 8080
CMD sed -i 's/listen       80;/listen       8080;/g' /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'