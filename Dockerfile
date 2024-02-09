from mcr.microsoft.com/devcontainers/miniconda:0.203.6-3

RUN pip install --no-cache-dir jupyterhub

ARG NB_USER=jiyan
ARG NB_UID=1003
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}

# RUN adduser --disabled-password \
#     --gecos "Default user" \
#     --uid ${NB_UID} \
#     ${NB_USER}

RUN mkdir /app
COPY . /app
RUN cd /app
