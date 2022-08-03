FROM alpine:3.15.5
LABEL "author"="Michael Kim(5zzang@gmail.com)"


RUN apk add --no-cache \
		ca-certificates

## INSTALL TERRAFORM
ARG TERRAFORM_VERSION=1.2.6

RUN echo Building image for Terraform ${TERRAFORM_VERSION} && \
    apk add --update git curl openssh gnupg && \
    curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip > terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_SHA256SUMS.sig > terraform_${TERRAFORM_VERSION}_SHA256SUMS.sig && \
    curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_SHA256SUMS > terraform_${TERRAFORM_VERSION}_SHA256SUMS && \
    grep linux_amd64 terraform_${TERRAFORM_VERSION}_SHA256SUMS >terraform_${TERRAFORM_VERSION}_SHA256SUMS_linux_amd64 && \
    sha256sum -cs terraform_${TERRAFORM_VERSION}_SHA256SUMS_linux_amd64 && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /bin && \
rm -f terraform_${TERRAFORM_VERSION}_linux_amd64.zip terraform_${TERRAFORM_VERSION}_SHA256SUMS*


## INSTALL COMMON DEPENDENCIES
RUN apk add --no-cache --update \
					 jq \
                     git \
                     zip \
                     bash \
                     fish \
					 openjdk17 \
					 maven \
					 gradle \
					 ansible \
					 py-pip \
					 groff \
					 gcc openssl-dev libffi-dev musl-dev python3-dev && \
	pip3 install awscli pywinrm --upgrade --user && \
	pip install boto boto3 pywinrm --upgrade --user

ENV PATH /root/.local/bin:$PATH

# start fish shell
CMD fish