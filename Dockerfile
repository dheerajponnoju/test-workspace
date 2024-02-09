from mcr.microsoft.com/devcontainers/miniconda:0.203.6-3

RUN pip install --no-cache-dir jupyterhub

RUN mkdir /app
COPY . /app
RUN cd /app
