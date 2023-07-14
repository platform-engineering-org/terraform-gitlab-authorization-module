FROM registry.access.redhat.com/ubi9:9.2-696@sha256:089bd3b82a78ac45c0eed231bb58bfb43bfcd0560d9bba240fc6355502c92976

ARG HOME=/root

COPY requirements.txt .tool-versions $HOME

# renovate: datasource=github-releases depName=asdf-vm/asdf
ENV ASDF_VERSION=v0.12.0

RUN curl -Lo /etc/yum.repos.d/rhel7-csb-stage.repo http://hdn.corp.redhat.com/rhel7-csb-stage/rhel7-csb-stage.repo && \
    sed -i 's/https:/http:/;s/gpgcheck=1/gpgcheck=0/' /etc/yum.repos.d/rhel7-csb-stage.repo && \
    dnf update -y && \
    dnf install -y git python3-pip make unzip redhat-internal-cert-install && \
    dnf clean all -y && \
    git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf --branch "${ASDF_VERSION}" --depth 1 && \
    . $HOME/.asdf/asdf.sh && \
    echo . "$HOME/.asdf/asdf.sh" > $HOME/.bash_profile && \
    asdf plugin-add terraform https://github.com/asdf-community/asdf-hashicorp.git && \
    asdf install && \
    pip3 install -r $HOME/requirements.txt
