# syntax=docker/dockerfile:1

#FROM pytorch/pytorch
FROM tiangolo/uwsgi-nginx-flask:python3.7

WORKDIR /intent-service
COPY ./requirements.txt requirements.txt
RUN pip install -r requirements.txt
RUN python -m spacy download en_core_web_sm
COPY . .

EXPOSE 6005

ENV FLASK_APP=main.py

CMD ["python", "-u", "main.py"]
#CMD ["flask", "run", "-h 0.0.0.0", "-p 6001"]
