FROM alpine:edge
RUN apk add make git llvm-dev xz crystal shards musl-dev openssl-dev openssl-libs-static yaml-static
WORKDIR /app
CMD sh
