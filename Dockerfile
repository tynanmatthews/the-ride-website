# base image
FROM node:20

# Create app directory
WORKDIR /app


# copy package.json & package-lock.json into the container
COPY package*.json ./

# Install dependencies
RUN npm ci

# copy the rest of the files into the container
COPY . .

# Build Next.js app
RUN npm run build

EXPOSE 3000

# start the app
CMD ["npm", "start"]