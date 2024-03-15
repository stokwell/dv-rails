FROM golang:alpine
RUN apk add git
ADD ./src/linguee-api /go/src/app
WORKDIR /go/src/app

RUN go get -d -v ./...

# Install the package
RUN go install -v ./...

ENV PORT=3001
CMD ["go", "run", "main.go"]