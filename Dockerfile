FROM alpine:edge
RUN apk add make git llvm-dev xz crystal shards musl-dev openssl-dev openssl-libs-static yaml-static
WORKDIR /app
COPY . .
RUN make static=yes
CMD ["sh"]
