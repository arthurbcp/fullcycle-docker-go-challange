FROM golang:1.11-alpine AS build

WORKDIR /usr/src/
COPY main.go go.* /usr/src/
RUN CGO_ENABLED=0 go build -o /bin/demo

FROM scratch
COPY --from=build /bin/demo /bin/demo
ENTRYPOINT ["/bin/demo"]