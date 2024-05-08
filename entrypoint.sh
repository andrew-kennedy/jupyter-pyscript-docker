#!/bin/bash

# Set default for HASS_PORT if not provided
if [ -z "$HASS_PORT" ]; then
  HASS_PORT=8123
fi

# Create the pyscript.conf from environment variables
cat << EOF > /opt/conda/share/jupyter/kernels/pyscript/pyscript.conf
[homeassistant]
hass_host = ${HASS_HOST}
hass_url = http://\${hass_host}:${HASS_PORT}
hass_token = ${HASS_TOKEN}
EOF

# Execute the passed command
exec "$@"
