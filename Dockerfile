FROM ghcr.io/turbot/steampipe
# Setup prerequisites (as root)
USER root:0
RUN apt-get update -y \
 && apt-get install -y git
# Install the azure and steampipe plugins for Steampipe (as steampipe user).
USER steampipe:0
RUN steampipe plugin install azure
RUN steampipe plugin install azuread
RUN  git clone --depth 1 https://github.com/turbot/steampipe-mod-azure-compliance.git /workspace
WORKDIR /workspace
CMD ["steampipe", "service", "start", "--foreground", "--dashboard", "--dashboard-listen=network"]
