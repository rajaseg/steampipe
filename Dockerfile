FROM turbot/steampipe
USER root:0
RUN apt-get update -y \
 && apt-get install -y git
USER steampipe:0
RUN steampipe plugin install azure
RUN steampipe plugin install azuread
RUN  git clone https://github.com/turbot/steampipe-mod-azure-compliance.git /workspace
WORKDIR /workspace
CMD ["steampipe", "service", "start", "--foreground", "--dashboard", "--dashboard-listen=network"]
