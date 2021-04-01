# Dockerfile, image, Container
FROM python:3.9.2

ADD main.py .

RUN pip install requests bs4 firebase pypopulation python_jwt six gcloud sseclient pycryptodome==3.10.1 requests_toolbelt

EXPOSE 5000

CMD ["python", "./main.py"]