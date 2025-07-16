FROM node:18-alpine

# Install dependencies
RUN apk add --no-cache graphicsmagick tzdata bash

# Install n8n globally
RUN npm install -g n8n

# Expose port for n8n
EXPOSE 5678

# Set default timezone (optional)
ENV TZ=Etc/UTC

# Set working dir
WORKDIR /home/node

# Start n8n
CMD ["sh", "-c", "n8n start --port=$PORT --host=0.0.0.0"]
