FROM tleyden5iwx/caffe-cpu-master

RUN apt-get update -yq && \
    apt-get install git software-properties-common curl wget bzip2 ca-certificates libglib2.0-0 libxext6 libsm6 libxrender1 -yq && \
    apt-get install python-numpy python-scipy python-matplotlib ipython ipython-notebook python-pandas python-sympy python-nose -yq && \
    pip install --upgrade tornado jsonschema && \
    mkdir /notebooks && \
    mkdir /notebooks/caffe && \
    cd /notebooks/caffe && \
    wget http://dl.caffe.berkeleyvision.org/bvlc_googlenet.caffemodel && \
    wget https://raw.githubusercontent.com/BVLC/caffe/master/models/bvlc_googlenet/deploy.prototxt && \
    wget https://upload.wikimedia.org/wikipedia/commons/1/16/Appearance_of_sky_for_weather_forecast%2C_Dhaka%2C_Bangladesh.JPG

COPY notebook.sh /notebook.sh
COPY dream.ipynb /notebooks/dream.ipynb

VOLUME /notebooks
WORKDIR /notebooks

ENV PEM_FILE /key.pem
ENV USE_HTTP 1

EXPOSE 8888

RUN chmod u+x /notebook.sh

CMD ["/notebook.sh"]
