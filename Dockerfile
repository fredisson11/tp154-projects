FROM python:3.11-alpine3.18

ENV PYTHONUNBUFFERED=1

WORKDIR /app/

COPY requirements.txt requirements.txt

RUN pip install --upgrade pip

RUN pip install --no-cache-dir -r requirements.txt

RUN adduser --disabled-password --no-create-home my_user

COPY . .

RUN chown -R my_user /app

RUN chmod -R 755 /app

EXPOSE 8000

CMD ["sh", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]
