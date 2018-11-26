FROM golang:1.11-alpine as build
WORKDIR /go/src
COPY server.go ./
RUN go build -o hello
#
#CMD ["./hello"]
FROM alpine as prod
WORKDIR /app
COPY --from=build /go/src/hello ./helloworld
RUN chmod +x helloworld
EXPOSE 1323
CMD ["./helloworld"]
