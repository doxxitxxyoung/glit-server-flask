# Currently written for cpu version

#FROM pytorch/pytorch:0.4.1-cuda9-cudnn7-runtime
#FROM ubuntu:16.04
#FROM gcr.io/glit-server-fast/glit-server-fast:v2
FROM doxxitxxyoung/glit-server-base



#RUN pip install Flask
#RUN pip install gunicorn

COPY . /root

WORKDIR /root
USER root

RUN git clone https://github.com/doxxitxxyoung/GLIT_pf.git
RUN (cd GLIT_pf && tar c .) | (tar xf -)
# downloading data / models
RUN pip install gdown
WORKDIR data
RUN gdown https://drive.google.com/uc?id=146o7-P6ElDZHu_KlS-VMu6X8_FeWHZOc
RUN unzip -o data_serve.zip
RUN rm data_serve.zip
#RUN rm labeled_list_woAmbi_92742_70138_old.pkl
WORKDIR ../

WORKDIR models
RUN gdown https://drive.google.com/uc?id=1EpAGz5Ztw3wKV-4H8nC4xF5hLwoCdixu
RUN unzip -o models.zip
RUN rm models.zip
WORKDIR ../

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

CMD ["python", "./server.py"]
#CMD ["uvicorn", "server_fastapi_mongo:app", "--reload", "--port", "8080"]
