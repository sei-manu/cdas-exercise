FROM golang:1.20-alpine

# Set maintainer label
LABEL maintainer="s2410455010@fhoee.at"

# Set the working directory
WORKDIR /src

# Copy the local main.go file to the working directory
COPY main.go .

# List items in the working directory
RUN ls -la

# Build the Go app and move it to /usr/
RUN go build -o cdas-exercise main.go && mv cdas-exercise /usr/

# Expose port 8010
EXPOSE 8010

# Run the service when the container starts
CMD ["/usr/myapp"]
