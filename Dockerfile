# Stage 1: Build the Go binary
FROM golang:1.24 AS builder
WORKDIR /app
COPY . .
RUN go build -o hello main.go

# Stage 2: Create a minimal image
FROM scratch
COPY --from=builder /app/hello /hello
CMD ["/hello"]
