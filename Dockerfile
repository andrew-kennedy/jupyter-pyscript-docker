FROM quay.io/jupyter/scipy-notebook:latest

# Install hass_pyscript_kernel and set up the pyscript kernel
RUN pip install hass_pyscript_kernel \
    && jupyter pyscript install

# Add pyscript.conf template
COPY pyscript.conf /opt/conda/share/jupyter/kernels/pyscript/pyscript.conf.template

# Substitute environment variable and move to final location
RUN envsubst < /opt/conda/share/jupyter/kernels/pyscript/pyscript.conf.template > /opt/conda/share/jupyter/kernels/pyscript/pyscript.conf

# Change ownership to jovyan:users
USER root
RUN chown jovyan:users /opt/conda/share/jupyter/kernels/pyscript/pyscript.conf