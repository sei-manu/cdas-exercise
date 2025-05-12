FROM golang:1.20-alpine

# Set maintainer label
LABEL maintainer="s2410455010@fhoee.at"

# Set the working directory
WORKDIR /src

COPY go.mod go.sum ./
RUN go mod download

# Copy all go files to the working directory
COPY *.go .

# List items in the working directory
RUN ls -la

# Build the Go app and move it to /usr/
RUN go build -o cdas-exercise . && mv cdas-exercise /usr/

# Expose port 8010
EXPOSE 8010

# Run the service when the container starts
CMD ["/usr/cdas-exercise"]
