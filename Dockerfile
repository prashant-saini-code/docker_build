FROM python:3.10.8 
ENV PYTHONUNBUFFERED 1

COPY requirements.txt /tmp/req.txt
COPY . /backendd
WORKDIR /backendd
EXPOSE 8000

ARG DEV=false

RUN pip install --upgrade pip && \
    pip install -r /tmp/req.txt && rm -rf /tmp 
    

ENV PATH="/scripts:/py/bin:$PATH"

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]