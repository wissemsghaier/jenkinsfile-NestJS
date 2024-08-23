# Dockerfile
# Use a stable Node.js version
FROM node:18.17.0

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json (if available) to the container
ADD extracted/package*.json ./


# Copy the rest of the application code
ADD extracted ./
# Remove existing node_modules
RUN rm -rf node_modules

# Reinstall dependencies
RUN npm install 
RUN npm run build


# Expose the port your application will run on
EXPOSE 80

# Set the default command to start the application
CMD ["npm", "start"]

