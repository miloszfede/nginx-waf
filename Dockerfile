FROM owasp/modsecurity:nginx

USER root
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/coreruleset/coreruleset.git /usr/local/modsecurity-crs \
    && cp /usr/local/modsecurity-crs/crs-setup.conf.example /usr/local/modsecurity-crs/crs-setup.conf

COPY modsecurity.conf /etc/nginx/modsecurity.d/modsecurity.conf
COPY crs-setup.conf /etc/nginx/modsecurity.d/crs-setup.conf

RUN mkdir -p /var/log/nginx

USER root

