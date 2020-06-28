FROM alpine:latest

ENV VERSION=0.12.28
ENV SHA256SUM=be99da1439a60942b8d23f63eba1ea05ff42160744116e84f46fc24f1a8011b6
ENV ARCH=linux_amd64

RUN apk add --update git curl openssh && \
    curl https://releases.hashicorp.com/terraform/${VERSION}/terraform_${VERSION}_${ARCH}.zip > terraform_${VERSION}_${ARCH}.zip && \
    echo "${SHA256SUM}  terraform_${VERSION}_${ARCH}.zip" > terraform_${VERSION}_SHA256SUMS && \
    sha256sum -cs terraform_${VERSION}_SHA256SUMS && \
    unzip terraform_${VERSION}_${ARCH}.zip -d /bin && \
    rm -f terraform_${VERSION}_${ARCH}.zip

ENTRYPOINT ["/bin/terraform"]
