FROM python:3.10-slim

# Создаем пользователя (Best Practice)
RUN useradd -m -u 1000 appuser

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

# Документируем порт (это важно для того, кто будет запускать контейнер)
EXPOSE 8080

USER appuser

# Запускаем!
CMD ["python", "app.py"]
