FROM registry:2.1.1

#Version: 0.2.0
#Tag: sieve/registry

WORKDIR /etc/docker/registry
WORKDIR /

# Entrypoint
COPY files/e /e
RUN chmod 755 /e

ENTRYPOINT ["/e" \
  , "--render-template=/etc/registry-config.yml.tmpl:/etc/docker/registry/config.yml" \
  , "--" \
]

COPY files/registry-config.yml.tmpl /etc
CMD ["/bin/registry", "/etc/docker/registry/config.yml"]
