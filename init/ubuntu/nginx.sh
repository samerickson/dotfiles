#! /bin/bash

sudo apt update && sudo apt install -y nginx certbot python-certbot-nginx

# If proper environment variables are set, otherwise exit
#   TODO:
#       - Maybe allow passing command line parameters as an alternate
#         to setting environment variables
#       - Should be able to quiet printf statements by -q as a
#         command line flag
[[ -z "${NGINX_DOMAIN_NAME}" ]] || \
    printf "NGINX_DOMAIN_NAME environment variable is not set\n"; \
    printf "You can set this variable by entering:\n\n\t"; \
    printf "export NGINX_DOMAIN_NAME"&& exit
[[ -z "${NGINX_EMAIL}" ]] || \
    printf "NGINX_EMAIL environment variable is not set\n"; \
    printf "You can set this variable by entering:\n\n\t"; \
    printf "export NGINX_EMAIL=example.com\n\n" && exit


# Get HTTPS enabled using certbot
printf "Enabling HTTPS for NGINX\n"
sudo certbot --non-interactive --redirect --agree-tos --nginx -d \
    "${NGINX_EMAIL}" -m "${NGINX_DOMAIN_NAME}"

printf "NGINX with HTTPS is now installed"
