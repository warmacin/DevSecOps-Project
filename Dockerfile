# Use a more secure and stable base image
FROM node:16-bullseye-slim AS base

# Set working directory
WORKDIR /app

# Copy package files first to leverage Docker caching
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy the rest of the application files
COPY . .

# Expose application port
EXPOSE 80

# Start the application
CMD ["npm", "start"]
