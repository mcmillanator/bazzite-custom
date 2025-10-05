# Allow build scripts to be referenced without being copied into the final image
FROM scratch AS ctx
COPY build_files /

# Base Image
FROM tower:5000/bazzite


### MODIFICATIONS
## make modifications desired in your image and install packages by modifying the build.sh script
## the following RUN directive does all the things required to run "build.sh" as recommended.

RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /ctx/build.sh
COPY --from=ctx /docker/daemon.json /etc/docker/daemon.json

# Set a user for local VM testing
# RUN useradd -s /bin/zsh -m -G wheel -G root dev
# RUN echo "dev:dev" | chpasswd
# RUN echo "dev ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/myuser
# RUN usermod -a -G wheel -G root root

### LINTING
## Verify final image and contents are correct.
RUN bootc container lint
LABEL note=bazzite-custom
LABEL containers.bootc="1"
LABEL io.artifacthub.package.deprecated="false"
LABEL io.artifacthub.package.keywords="bootc,bazzite,custom"
LABEL io.artifacthub.package.license="Apache-2.0"
LABEL io.artifacthub.package.readme-url="https://raw.githubusercontent.com/mcmillanator/bazzite-custom/refs/heads/main/README.md"
LABEL org.opencontainers.image.description="My Customized Bazzite Image"
LABEL org.opencontainers.image.documentation="https://raw.githubusercontent.com/mcmillanator/bazzite-custom/refs/heads/main/README.md"
LABEL org.opencontainers.image.title="bazzite-custom"
LABEL org.opencontainers.image.url="https://github.com/mcmillanator/bazzite-custom"

