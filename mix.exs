defmodule IFriend.Mixfile do
  use Mix.Project

  def project do
    [
      app: :IFriend,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      mod: {IFriend, []},
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:distillery, "~> 1.5"},
      {:httpoison, "~> 1.0"}
    ]
  end
end
