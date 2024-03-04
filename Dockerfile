FROM debian:12-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt upgrade -y && \
  apt install -y --no-install-recommends curl ca-certificates git gnupg2 python3 pipx wget

# misc tools
RUN pipx install awscli
RUN pipx install yamllint

# Install yq
RUN wget -q https://github.com/mikefarah/yq/releases/download/v4.42.1/yq_linux_amd64.tar.gz -O - | tar xz && \
  mv yq_linux_amd64 /usr/bin/yq && \
  chmod +x /usr/bin/yq

# kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -Ls https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
  mv kubectl /usr/local/bin/kubectl && \
  chmod +x /usr/local/bin/kubectl && \
  kubectl version --client

# helm
RUN curl -fsSL https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

# helm S3 plugin
RUN helm plugin install https://github.com/hypnoglow/helm-s3.git

# aws-iam-authenticator
# https://docs.aws.amazon.com/eks/latest/userguide/install-aws-iam-authenticator.html
RUN curl https://github.com/kubernetes-sigs/aws-iam-authenticator/releases/download/v0.5.9/aws-iam-authenticator_0.5.9_linux_amd64 -Lo aws-iam-authenticator && \
  chmod +x ./aws-iam-authenticator && \
  mv aws-iam-authenticator /usr/local/bin/aws-iam-authenticator && \
  aws-iam-authenticator help

CMD bash
