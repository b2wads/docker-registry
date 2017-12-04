FROM registry:2.1.1

#Version: 0.0.1
#Tag: sieve/registry

COPY files/registry-config.yml.tmpl /etc
WORKDIR /etc/docker/registry
WORKDIR /

# Entrypoint
COPY files/e /e
RUN chmod 755 /e

ENTRYPOINT ["/e" \
  , "--render-template=/etc/registry-config.yml.tmpl:/etc/docker/registry/config.yml" \
  , "--" \
]

CMD ["/bin/registry", "/etc/docker/registry/config.yml"]
