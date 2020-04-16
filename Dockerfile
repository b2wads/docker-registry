FROM registry:2.7

#Version: 0.5.0

WORKDIR /etc/docker/registry
WORKDIR /

# Entrypoint
COPY files/e /e
RUN chmod 755 /e

ENTRYPOINT ["/e" \
  , "--render-template=/etc/registry-config.yml.tmpl:/etc/docker/registry/config.yml" \
  , "--render-template=/etc/htpasswd.tmpl:/etc/docker/registry/htpasswd" \
  , "--render-template=/etc/gcs-key-file.tmpl:/etc/docker/registry/gcs-key-file.json" \
  , "--" \
]

COPY files/registry-config.yml.tmpl /etc
COPY files/htpasswd.tmpl /etc
COPY files/gcs-key-file.tmpl /etc
CMD ["/bin/registry", "serve", "/etc/docker/registry/config.yml"]
