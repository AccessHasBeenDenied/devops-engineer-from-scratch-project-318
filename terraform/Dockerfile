FROM hashicorp/terraform:1.14

WORKDIR /tf
COPY .terraformrc /root/.terraformrc
COPY main.tf main.tf

RUN terraform init \
    && wget https://storage.yandexcloud.net/yandexcloud-yc/release/yc_linux_amd64.tar.gz \
    && tar -xzf yc_linux_amd64.tar.gz \
    && chmod +x yc \
    && mv yc /usr/bin \
    && rm -rf yc_linux_amd64.tar.gz


ENTRYPOINT ["/bin/sh"]