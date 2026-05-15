# STAGE 1: Build Stage
FROM node:18 AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
# If your app has a build script, it runs here. 
# If it fails, the next step might not find the folder.
RUN npm run build --if-present

# STAGE 2: Production Stage
FROM node:18-alpine
WORKDIR /app

# Security Hardening: Create and use a non-root user [cite: 56, 59]
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

# Copy files from Stage 1 
# If 'dist' doesn't exist, we copy the current directory files
COPY --from=build /app ./

# Command to run the application [cite: 51]
CMD ["node", "server.js"]