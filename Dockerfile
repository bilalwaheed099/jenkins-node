# Use the official Node.js 20 image with Alpine Linux for a small footprint
FROM node:22-alpine

# Set working directory
WORKDIR /app

# Copy only package files to install dependencies first
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Expose the port Express will listen on
# EXPOSE 3000

# Start the app
CMD ["node", "app.js"]
