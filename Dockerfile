ARG CODE_SERVER_VERSION=focal
FROM "codercom/code-server:$CODE_SERVER_VERSION"

USER root

WORKDIR /home/coder
COPY extensions.txt .

USER root
RUN xargs -n1 code-server --install-extension < extensions.txt\
    && rm extensions.txt\
    && apt-get update && apt-get install --no-install-recommends -y shellcheck\
    && wget -q https://github.com/hadolint/hadolint/releases/latest/download/hadolint-Linux-x86_64\
    && mv hadolint-Linux-x86_64 /usr/local/bin/hadolint\
    && chmod +x /usr/local/bin/hadolint\
    && apt-get install --no-install-recommends -y yamllint\
    && apt-get clean\
    && rm -rf /var/lib/apt/lists/*

USER 1000

ENTRYPOINT ["/usr/bin/entrypoint.sh", "--bind-addr", "0.0.0.0:8080", "."]
