#!/bin/sh

sudo docker build -t gcr.io/glit-server-fast/glit-server-flask:latest .
sudo docker push gcr.io/glit-server-fast/glit-server-flask:latest
