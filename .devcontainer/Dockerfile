FROM registry.access.redhat.com/ubi9:9.2-722.1692769367@sha256:572155f3053e0267874da447743adec560458824c12d3f8acd429f781656cf33

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
