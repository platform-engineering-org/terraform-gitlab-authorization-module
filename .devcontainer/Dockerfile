FROM registry.access.redhat.com/ubi9:9.2-755@sha256:351ed8b24d440c348486efd99587046e88bb966890a9207a5851d3a34a4dd346

ARG USERNAME=user
ARG USER_UID=1000
ARG USER_GID=$USER_UID
ARG USER_HOME=/home/$USERNAME

ARG ROOT_HOME=/root

COPY requirements.txt $ROOT_HOME

RUN groupadd --gid $USER_GID $USERNAME && \
    useradd --uid $USER_UID --gid $USER_GID $USERNAME && \
    chown -R $USER_UID:$USER_GID /home/$USERNAME && \
    dnf install -y git python3-pip make unzip && \
    dnf clean all -y && \
    pip3 install -r $ROOT_HOME/requirements.txt && \
    update-ca-trust

USER $USERNAME

# renovate: datasource=github-releases depName=asdf-vm/asdf
ENV ASDF_VERSION=v0.13.1

COPY .tool-versions $USER_HOME

RUN git clone https://github.com/asdf-vm/asdf.git $USER_HOME/.asdf --branch "${ASDF_VERSION}" --depth 1 && \
    . $USER_HOME/.asdf/asdf.sh && \
    echo . "$USER_HOME/.asdf/asdf.sh" > $USER_HOME/.bash_profile && \
    asdf plugin-add terraform https://github.com/asdf-community/asdf-hashicorp.git && \
    asdf plugin-add terragrunt https://github.com/ohmer/asdf-terragrunt.git && \
    asdf install
