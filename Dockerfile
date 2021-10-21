FROM python:3.9-alpine AS build-stage
RUN mkdir -p ./templates/
COPY requirements.txt flask_app.py ./
COPY 404 game ./templates/
RUN pip3 install -r requirements.txt
FROM alpine
COPY --from=build-stage . .
ENTRYPOINT ["python3"]
CMD ["flask_app.py"]
