FROM quay.io/jupyter/scipy-notebook:latest

# Install hass_pyscript_kernel and set up the pyscript kernel
RUN pip install hass_pyscript_kernel plexapi \
    && jupyter pyscript install

# Add the entrypoint script
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

# Change ownership to jovyan:users
USER root
RUN chmod +x /usr/local/bin/entrypoint.sh
RUN chown jovyan:users /usr/local/bin/entrypoint.sh

USER jovyan

ENTRYPOINT ["entrypoint.sh"]
CMD ["start-notebook.py"]
