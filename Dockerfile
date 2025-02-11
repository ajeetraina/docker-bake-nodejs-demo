# Base stage for shared dependencies
FROM node:18-alpine AS base
WORKDIR /app
COPY package*.json ./

# Development stage
FROM base AS development
RUN npm install
COPY . .
CMD ["npm", "run", "dev"]

# Builder stage for production
FROM base AS builder
RUN npm ci
COPY . .
RUN npm run build

# Production stage
FROM base AS production
RUN npm ci --only=production
COPY --from=builder /app/dist ./dist
CMD ["npm", "start"]