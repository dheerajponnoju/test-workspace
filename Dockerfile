from jupyter/pyspark-notebook:latest

# RUN pip install --no-cache-dir jupyterhub
RUN apt install julia
RUN /bin/sh -c JULIA_PROJECT="" julia -e "using Pkg; Pkg.add(\"IJulia\"); using IJulia;
installkernel(\"Julia\", \"--project=${REPO_DIR}\");" && julia --project=${REPO_DIR} -e 'using Pkg;
Pkg.instantiate(); Pkg.resolve(); pkg"precompile"

ARG NB_USER=jovyan
ARG NB_UID=8002
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}

# RUN adduser --disabled-password \
#     --gecos "Default user" \
#     --uid ${NB_UID} \
#     ${NB_USER}

# RUN mkdir /app
# COPY . /app
# RUN cd /app

# Make sure the contents of our repo are in ${HOME}
COPY . ${HOME}
USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}
