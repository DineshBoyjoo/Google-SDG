# Dockerfile, image, Container
FROM python:3.8

ADD main.py .

RUN pip install requests bs4 firebase gcloud pypopulation python_jwt six sseclient pycryptodome==3.10.1 requests_toolbelt protobuf==3.12.0

EXPOSE 5000

CMD ["python", "./main.py"]
