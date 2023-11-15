FROM alpine:latest AS builder

# Install Hugo
RUN apk add --no-cache hugo

# Set the working directory in the container
WORKDIR /usr/share/profile

# Copy the contents of your project into the container
COPY . .

# Automatically build the site
RUN hugo

FROM nginx:stable

COPY ./nginx.conf /etc/nginx/conf.d/default.conf

COPY --from=builder /usr/share/profile/public/ /usr/share/nginx/html/