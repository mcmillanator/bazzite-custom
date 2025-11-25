#! /bin/sh
set -e
upstream_image="ghcr.io/ublue-os/bazzite:stable"
local_upstream_cache="tower:5000/bazzite:stable"
custom_image="tower:5000/bazzite-custom"

echo "Pulling upstream image: $upstream_image"
podman pull -q $upstream_image
echo "Tagging upstream_image: $upstream_image to: $local_upstream_cache"
podman tag $upstream_image $local_upstream_cache
echo "Pushing upstream_image: $upstream_image to: $local_upstream_cache"
podman push -q --remove-signatures $local_upstream_cache
just build
podman push -q "$custom_image:latest"
podman tag "$custom_image:latest" "$custom_image:stable"
podman push -q "$custom_image:stable"
echo "$custom_image update complete."
sudo rpm-ostree upgrade
