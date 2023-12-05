# Use rust stable as base package
FROM rust:1.72.0 AS builder
WORKDIR /app
COPY . .
ENV SQLX_OFFLINE true
RUN cargo build --release --bin zero2prod

FROM debian:bookworm-slim as runtime
WORKDIR /app
RUN apt-get update -y \
    && apt-get install -y --no-install-recommends openssl ca-certificates \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*
COPY --from=builder /app/target/release/zero2prod zero2prod
COPY configuration/default.yml configuration/default.yml
COPY configuration/local.yml configuration/local.yml
COPY configuration/production.yml configuration/production.yml
ENV APP_ENVIRONMENT production
ENTRYPOINT ["./zero2prod"]