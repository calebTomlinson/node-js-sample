# Pull base image.
FROM ubuntu:12.04

# Install Node.js
RUN apt-get install -y python-software-properties
RUN add-apt-repository -y ppa:chris-lea/node.js
RUN apt-get update
RUN apt-get install -y nodejs

# Append to $PATH variable.
RUN echo '\n# Node.js\nexport PATH="node_modules/.bin:$PATH"' >> /root/.bash_profile

# Define default command.
ADD . /app
RUN cd /app && npm install
EXPOSE 5000
CMD ["node", "/app/web.js"]
