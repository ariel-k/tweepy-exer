FROM python:3.7-alpine

COPY ./streaming.py /tmp
COPY requirements.txt /tmp
RUN pip3 install -r /tmp/requirements.txt

EXPOSE 80 443

WORKDIR /tmp
CMD ["python3", "streaming.py"]
