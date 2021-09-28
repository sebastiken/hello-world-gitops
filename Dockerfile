FROM golang:1.8 AS build

WORKDIR /go/src/github.com/codeship/go-hello-world
COPY hello-world.go .
RUN go build -o hello-world .

FROM alpine:3.14 AS final

WORKDIR /app
COPY --from=build /go/src/github.com/codeship/go-hello-world/hello.world .
CMD ./hello-world
