FROM python:3.9-slim-buster
RUN apt-get update && apt-get install -y --no-install-recommends 
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
COPY requirements.txt ./
RUN pip3 install -r requirements.txt
CMD ["python3", "-m", "http.server", "8000"]