FROM jupyter/scipy-notebook:latest

USER root

# RUN apk add gcc python3-dev musl-dev linux-headers
RUN pip install --no-cache-dir jupyterhub

ARG NB_USER=jovyan
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}

USER root
RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}
# RUN mkdir /app

# Make sure the contents of our repo are in ${HOME}
# COPY . /app
# Make sure the contents of our repo are in ${HOME}
COPY . ${HOME}
USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}
