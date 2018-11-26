FROM golang:1.11 as builder
COPY . .
RUN go get github.com/labstack/echo
RUN go build -o hello

FROM alpine:3.8

RUN addgroup -S app \
    && adduser -S -g app app \
    && apk --no-cache add \
    curl openssl netcat-openbsd
WORKDIR /home/app
COPY --from=builder ./hello ./hello
RUN chown -R app:app ./
USER app
CMD ["./hello"]
