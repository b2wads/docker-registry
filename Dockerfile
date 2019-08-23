FROM registry:2.7

#Version: 0.3.0
#Tag: sieve/registry

WORKDIR /etc/docker/registry
WORKDIR /

ENV REGISTRY_AUTH_HTPASSWD_REALM=Registry

# Entrypoint
COPY files/e /e
RUN chmod 755 /e

ENTRYPOINT ["/e" \
  , "--render-template=/etc/registry-config.yml.tmpl:/etc/docker/registry/config.yml" \
  , "--" \
]

COPY files/registry-config.yml.tmpl /etc
CMD ["/bin/registry", "serve", "/etc/docker/registry/config.yml"]
