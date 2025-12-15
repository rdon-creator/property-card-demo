FROM nginx:alpine
COPY index.html /usr/share/nginx/html/index.html
EXPOSE 8080
CMD sed -i 's/listen       80;/listen       8080;/g' /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'
```

---

**File 3: `.gitignore`**
```
.DS_Store
*.log
```

---

Your folder should look like this:
```
property-card-demo/
├── index.html
├── Dockerfile
└── .gitignore