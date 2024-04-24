# kube-tools

A Docker image based on Debian 12 that comes with all the tools you need to work with Kubernetes, Helm charts, AWS (awscli), AWS EKS, and Digital Ocean Kubernetes. Intended to be a flexible foundation of tools for CI/CD workflows.

This is a simplified version of [jshimko/kube-tools](https://github.com/jshimko/kube-tools)

## Included Tools

- kubectl - <https://kubernetes.io/docs/reference/kubectl/overview/>
- Helm 3 - <https://github.com/kubernetes/helm>
- Helm S3 plugin - <https://github.com/hypnoglow/helm-s3>
- awscli - <https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html>
- aws-iam-authenticator - <https://github.com/kubernetes-sigs/aws-iam-authenticator>
- yamllint - <https://github.com/adrienverge/yamllint>
- yq 4.42.1 (YAML parser based on `jq`) - <https://github.com/mikefarah/yq>

# Credits

Based on [jshimko/kube-tools](https://github.com/jshimko/kube-tools)
