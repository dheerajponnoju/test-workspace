from conda/miniconda3:2141bfc4b60cc5eb332402207c80d884daa72fcefa48b50f3ccadd934d1f3d03

RUN pip install --no-cache-dir jupyterhub

RUN mkdir /app
COPY . /app
RUN cd /app
