FROM python:2.7-slim

RUN pip install ipmisim pycryptodome

COPY app.py /app/app.py

EXPOSE 6230/udp

ENTRYPOINT ["python", "/app/app.py", "6230"]
