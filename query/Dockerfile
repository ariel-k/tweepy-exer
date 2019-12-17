FROM python:3.7-alpine

COPY ./query.py /tmp
COPY requirements.txt /tmp
RUN pip3 install -r /tmp/requirements.txt

WORKDIR /tmp
CMD ["python3", "query.py"]
