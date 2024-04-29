# Use the official Node.js image as base
FROM node:18.18.0

# Set the working directory in the container
WORKDIR /frontend

# Copy package.json and package-lock.json to the working directory
COPY academics/package*.json ./

# Install dependencies
RUN npm install -g yarn --force
RUN npm config set @neosoft-technologies:registry https://npm.pkg.github.com
RUN npm config set //npm.pkg.github.com/:_authToken=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
RUN yarn

# Copy the rest of the application code to the working directory
COPY . .

# Install next globally
RUN npm install -g next@13.5.6

# Build the Next.js application
RUN yarn build

# Expose the port Next.js is running on
EXPOSE 3006

# Command to run the Next.js application
CMD ["npm", "start"]
