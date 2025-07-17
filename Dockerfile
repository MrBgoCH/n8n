FROM node:18-alpine

# Install dependencies
RUN apk add --no-cache graphicsmagick tzdata bash

# Install n8n globally
RUN npm install -g n8n

# Create working directory (and ensure correct ownership)
RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node

# Use non-root user for correct folder usage
USER node

# Environment configuration
ENV PORT=5678
ENV TZ=Etc/UTC
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678

# Set correct working directory
WORKDIR /home/node

# Expose port and run
EXPOSE ${PORT}
CMD ["n8n", "start"]

