FROM elixir:1.6-alpine

RUN mkdir /app
WORKDIR /app
ENV MIX_ENV dev
RUN mix local.hex --force
RUN mix local.rebar --force
COPY mix.exs .
COPY mix.lock .
RUN mix deps.get
RUN mix deps.compile
CMD mix run
