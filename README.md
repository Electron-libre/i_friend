# IFriend

This application illustrate Elixir runtime configuration with env variables.
It's based on the community standard of `{:system, var}` tupple.

It also showcase docker releases with distillery.
( see `ops/` directory )

To build a release :

`ops/release/compose build`

To run the release :

`ops/release/compose up prod`

To run tests :

`ops/test/compose up`

To run dev version:

`ops/dev/compose up`
