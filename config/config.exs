use Mix.Config

config :IFriend, :greeter, {:system, "GREETER", "hello"}
config :IFriend, :greeting, [max: {:system, "MAX"}]
config :IFriend, :greet_medium_adapter, IFriend.GreetMedium.SMS

case Mix.env do
  :prod -> :ok
  _ -> import_config "#{Mix.env}.exs"
end

