FROM golang as builder

COPY sticky.go /go/src/stickyweb/sticky.go

WORKDIR /go/src/stickyweb/
RUN CGO_ENABLED=0 GOOS=linux go build -installsuffix cgo sticky.go

FROM alpine
RUN apk --update add ca-certificates
COPY --from=builder /go/src/stickyweb /stickyweb
RUN chmod a+rx /stickyweb/sticky
EXPOSE 8080 
CMD ["/stickyweb/sticky"]
