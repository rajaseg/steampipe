FROM ghcr.io/turbot/steampipe
USER root:0
RUN apt-get update -y \
 && apt-get install -y git
USER steampipe:0
RUN steampipe plugin install azure
RUN steampipe plugin install azuread
RUN  git clone --depth 1 https://github.com/turbot/steampipe-mod-azure-compliance.git /workspace
WORKDIR /workspace
EXPOSE 9595
CMD ["steampipe", "service", "start", "--foreground", "--dashboard", "--dashboard-listen=network"]
