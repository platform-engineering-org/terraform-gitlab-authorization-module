FROM registry.access.redhat.com/ubi9:9.2-755@sha256:351ed8b24d440c348486efd99587046e88bb966890a9207a5851d3a34a4dd346

ARG HOME=/root

COPY requirements.txt .tool-versions $HOME

# renovate: datasource=github-releases depName=asdf-vm/asdf
ENV ASDF_VERSION=v0.13.1

RUN dnf install -y git python3-pip make unzip && \
    dnf clean all -y && \
    git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf --branch "${ASDF_VERSION}" --depth 1 && \
    . $HOME/.asdf/asdf.sh && \
    echo . "$HOME/.asdf/asdf.sh" > $HOME/.bash_profile && \
    asdf plugin-add terraform https://github.com/asdf-community/asdf-hashicorp.git && \
    asdf install && \
    pip3 install -r $HOME/requirements.txt
