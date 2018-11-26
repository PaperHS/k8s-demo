FROM golang:1.11 as build
WORKDIR /go/src
COPY server.go ./
RUN go build -o ./hello

FROM alpine:3.8
WORKDIR /root
COPY --from=build /go/src/hello .
RUn chmod +x /root/hello
ENTRYPOINT ["/root/hello"]
