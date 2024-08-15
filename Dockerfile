# Use Node.js as the base image
FROM node:20.10-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and yarn.lock to the working directory
COPY package.json yarn.lock ./

# If vue-tsc and vite are dev dependencies, install them globally
RUN yarn global add vue-tsc vite

# Install the dependencies
RUN yarn install

# Copy the rest of the application code to the working directory
COPY . .

# Run the build command
RUN yarn --ignore-engines && yarn build

# Expose the port where the app will run
EXPOSE 5173

# Start the server using the production build
# CMD ["yarn", "serve"]
