FROM nginx:alpine
COPY app/ /usr/share/nginx/html/
HEALTHCHECK --interval=15s --timeout=3s --start-period=5s --retries=3 CMD wget -q --spider http://127.0.0.1/ || exit 1
EXPOSE 80
