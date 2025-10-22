# Use an official Node.js runtime as a parent image
FROM node:18-alpine

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the app.js file into the container at /usr/src/app
COPY app.js .

# Make port 3000 available to the outside world
EXPOSE 3000

# Define the command to run the app
CMD [ "node", "app.js" ]
