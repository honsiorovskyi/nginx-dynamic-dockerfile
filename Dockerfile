FROM nginx:latest

ENV LATEST_RELEASE=0.1-alpha

ADD https://raw.githubusercontent.com/honsiorovskyi/nginx_config_updater/$LATEST_RELEASE/default.conf.tmpl \
    /opt/nginx_config_updater/default.conf.tmpl
ADD https://github.com/honsiorovskyi/nginx_config_updater/releases/download/$LATEST_RELEASE/nginx_config_updater \
    /opt/nginx_config_updater/bin/nginx_config_updater
RUN chmod +x /opt/nginx_config_updater/bin/nginx_config_updater


CMD /opt/nginx_config_updater/bin/nginx_config_updater \
    --template=/opt/nginx_config_updater/default.conf.tmpl \
    --out=/etc/nginx/conf.d/default.conf \
    & nginx -g "daemon off;"
