FROM bitnami/wordpress:5.4.2-debian-10-r32

ENV WOOCOMMERCE_VERSIION 4.3.0

ADD https://downloads.wordpress.org/plugin/woocommerce.${WOOCOMMERCE_VERSIION}.zip /opt/bitnami/wordpress/wp-content/plugins/

USER 0

RUN cd /opt/bitnami/wordpress/wp-content/plugins \
    && unzip woocommerce.${WOOCOMMERCE_VERSIION}.zip \
    && chown -R 1001:root woocommerce \
    && rm woocommerce.${WOOCOMMERCE_VERSIION}.zip

USER 1001