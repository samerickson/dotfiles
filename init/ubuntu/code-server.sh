#! /bin/bash

# TODO:
#       - Add -q support

# Make sure CODE_SERVER_DOMAIN is set
[[ -z "${CODE_SERVER_DOMAIN}" ]] || \
    printf "ERROR: CODE_SERVER_DOMAIN is not set.\n"; \
    printf "You can set this by entering:\n\n\t"; \
    printf "export CODE_SERVER_DOMAIN=example.com"
[[ -z "${CODE_SERVER_EMAIL}" ]] || \
    printf "ERROR: CODE_SERVER_DOMAIN is not set.\n"; \
    printf "You can set this by entering:\n\n\t"; \
    printf "export CODE_SERVER_EMAIL=jdow@example.com"

# Make sure NGINX is already installed
which nginx > /dev/null || printf "ERROR: NGINX is not installed\n" && exit

[ -d "/etc/nginx/sites-available" ] || \
    printf "ERROR: \"/etc/nginx/sites-available\" does not exist" && exit

# Run the code-server install script
curl -fsSL https://code-server.dev/install.sh | sh

# Add configuration files
mkdir -p "${XDG_CONFIG:-HOME/.config}/code-server"

cat <<EOF > ${HOME}/.config/code-server
bind-addr: 127.0.0.1:${CODE_SERVER_PORT:-8080}
auth: password
password: ${CODE_SERVER_PASSWORD}
cert: false
EOF

# Add NGINX file for subdomain code-server
cat <<EOF > /etc/nginx/sites-available/code-server
server {
    listen 80;
    listen [::]:80;
    server_name ${CODE_SERVER_DOMAIN};

    location / {
      proxy_pass http://localhost:${CODE_SERVER_PORT:-8080}/;
      proxy_set_header Host \$host;
      proxy_set_header Upgrade \$http_upgrade;
      proxy_set_header Connection upgrade;
      proxy_set_header Accept-Encoding gzip;
    }
}
EOF

# Enable the site in NGINX
sudo ln -s "/etc/nginx/sites-available/${CODE_SERVER_SUBDOMAIN:-code-server}" \
    "/etc/nginx/sites-enabled/${CODE_SERVER_SUBDOMAIN:-code-server}"

# Enable HTTPS for the subdomain
sudo certbot --non-interactive --redirect --agree-tos --nginx -d \
    "${CODE_SERVER_DOMAIN}" -m "${CODE_SERVER_EMAIL}"

# Install Extentions
# ==================

# Color scheme only available from Microsoft marketplace so we have to load it manually
wget https://marketplace.visualstudio.com/_apis/public/gallery/publishers/jaccon/vsextensions/punk-dark-theme/1.0.2/vspackage -P /tmp/punk-dark-theme.vsix
code-server --install-extention /tmp/punk-dark-theme
rm /tmp/punk-dark-theme.vsix

# Doxygen code comment generator
code-server --install-extension cschlosser.doxdocgen

# Vim Script syntax highlighting
code-server --install-extension dunstontc.viml

printf "Finished installing code-server"
