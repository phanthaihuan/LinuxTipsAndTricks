https://grafana.com/docs/grafana/latest/auth/ldap/#configuration-examples

docker stop grafanad && docker rm grafanad 2>&1 > /dev/null

docker pull grafana/grafana

docker volume create grafana-storage 2>&1 > /dev/null
docker volume create grafana-config 2>&1 > /dev/null

docker run -itd \
--name grafanad \
--hostname grafanad \
-p 3000:3000 \
-e "GF_LOG_MODE=console file" \
-e "GF_AUTH_LDAP_ENABLED=true" \
-e "GF_AUTH_LDAP_CONFIG_FILE=/etc/grafana/ldap.toml" \
-e "GF_AUTH_LDAP_ALLOW_SIGN_UP=true" \
-v grafana-storage:/var/lib/grafana \
-v grafana-config:/etc/grafana \
grafana/grafana

# docker run -itd \
# --name grafanad \
# --hostname grafanad \
# -p 3000:3000 \
# -e "GF_LOG_MODE=console file" \
# grafana/grafana
