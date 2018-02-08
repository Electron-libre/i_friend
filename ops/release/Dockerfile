FROM elixir:1.6-alpine as builder

WORKDIR /app
ENV MIX_ENV prod
RUN mix local.hex --force && \
    mix local.rebar --force && \
    mix hex.info
ADD mix.exs mix.exs
ADD mix.lock mix.lock
RUN mix deps.get
ADD . .
RUN mix release --env=$MIX_ENV

FROM alpine
RUN apk --update add --no-cache bash \
    ncurses-libs \
    zlib \
    openssl \
    ca-certificates
WORKDIR /app
COPY --from=builder /app/_build/prod/rel/ .
RUN rm -f /var/cache/apk/*
CMD ["./IFriend/bin/IFriend", "foreground"]
