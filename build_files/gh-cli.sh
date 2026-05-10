dnf5 install -y dnf5-plugins
dnf5 config-manager addrepo -y --from-repofile=https://cli.github.com/packages/rpm/gh-cli.repo
dnf5 install -y gh --repo gh-cli
