# Python Service
FROM python:3.11-slim as python-app
WORKDIR /app
COPY app.py requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 5000
HEALTHCHECK --interval=30s --timeout=3s \
  CMD curl -f http://localhost:5000/health || exit 1
CMD ["python", "app.py"]

# Node Service
FROM node:18-alpine as node-app
WORKDIR /app
COPY package.json index.js ./
RUN npm install --production
EXPOSE 3000
HEALTHCHECK --interval=30s --timeout=3s \
  CMD curl -f http://localhost:3000/health || exit 1
CMD ["node", "index.js"]
