FROM golang:1.17.6-buster AS builder

WORKDIR /app

COPY . .

RUN go mod download

RUN go build -v -o server

FROM debian:buster-slim

EXPOSE 8080

COPY --from=builder /app/server /app/server

CMD ["/app/server"]