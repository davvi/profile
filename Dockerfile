FROM alpine:latest

# Install Hugo
RUN apk add --no-cache hugo

# Set the working directory in the container
WORKDIR /usr/share/profile

# Copy the contents of your project into the container
COPY . .

# Expose the default Hugo port
EXPOSE 1313

# Automatically build the site
RUN hugo

# Serve the site on Hugo's default port
CMD ["hugo", "server", "-D", "--bind", "0.0.0.0"]