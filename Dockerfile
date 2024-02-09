from conda/miniconda3:2141bfc4b60c

RUN pip install --no-cache-dir jupyterhub

RUN mkdir /app
COPY . /app
RUN cd /app
