FROM node:18-alpine

# Install dependencies
RUN apk add --no-cache graphicsmagick tzdata bash

# Install n8n
RUN npm install -g n8n

# Tell Render which port this app uses
ENV PORT=5678
EXPOSE 5678

# Set timezone
ENV TZ=Etc/UTC

# Set working directory
WORKDIR /home/node

# Set required host and port environment for n8n to bind properly
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678

# Run n8n using correct startup command
CMD ["n8n", "start"]
