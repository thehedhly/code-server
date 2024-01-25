ARG CODE_SERVER_VERSION=focal
FROM "codercom/code-server:$CODE_SERVER_VERSION"

WORKDIR /home/coder
COPY extensions.txt .

RUN <<EOR
    xargs -n1 code-server --install-extension < extensions.txt
    rm extensions.txt
EOR

ENTRYPOINT ["/usr/bin/entrypoint.sh", "--bind-addr", "0.0.0.0:8080", "."]