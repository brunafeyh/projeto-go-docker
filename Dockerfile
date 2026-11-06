FROM golang:1.24-alpine AS builder

WORKDIR /app

COPY go.mod ./
COPY main.go ./

RUN apk add --no-cache upx \
    && CGO_ENABLED=0 GOOS=linux go build \
    -trimpath \
    -ldflags="-s -w -buildid=" \
    -o /fullcycle . \
    && upx --best --lzma /fullcycle

FROM scratch

COPY --from=builder /fullcycle /fullcycle

ENTRYPOINT ["/fullcycle"]
