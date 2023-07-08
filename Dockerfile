FROM golang:latest AS builder
RUN apt-get update
# ENV
WORKDIR /go/src/app
COPY go.mod .
RUN go mod download
COPY . .
RUN go install
RUN go install github.com/ybkuroki/go-webapp-sample@latest
CMD ["go","run","/go/src/app/main.go"]