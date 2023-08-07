FROM registry.access.redhat.com/ubi9:9.2-722@sha256:c35238b35cbebe4e6c5d0f63a54e54dba41d0b425f2d101ad9f04a5e5ec100b8

ARG HOME=/root

COPY requirements.txt .tool-versions $HOME

# renovate: datasource=github-releases depName=asdf-vm/asdf
ENV ASDF_VERSION=v0.12.0

RUN dnf install -y git python3-pip make unzip && \
    dnf clean all -y && \
    git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf --branch "${ASDF_VERSION}" --depth 1 && \
    . $HOME/.asdf/asdf.sh && \
    echo . "$HOME/.asdf/asdf.sh" > $HOME/.bash_profile && \
    asdf plugin-add terraform https://github.com/asdf-community/asdf-hashicorp.git && \
    asdf install && \
    pip3 install -r $HOME/requirements.txt
