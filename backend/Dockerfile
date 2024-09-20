FROM python:3.9 AS builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt


FROM python:3.9-slim
WORKDIR /app
COPY --from=builder /app /app
COPY . .
ENTRYPOINT ["sh", "/app/entrypoint.sh"]

HEALTHCHECK --interval=30s --timeout=5s \
  CMD curl -f http://localhost/ || exit 1