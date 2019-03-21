FROM alpine:3.8
RUN apk update && \
  apk upgrade --no-cache && \
  apk add --no-cache \
  git openssh
RUN git clone git@github.com:PaperHS/TestDocker.git
# FROM golang:1.11-alpine as build
# WORKDIR /go/src
# COPY server.go ./
# RUN go build -o hello
# #
# #CMD ["./hello"]
# FROM alpine as prod
# WORKDIR /app
# COPY --from=build /go/src/hello ./helloworld
# RUN chmod +x helloworld
# EXPOSE 1323
# CMD ["./helloworld"]
