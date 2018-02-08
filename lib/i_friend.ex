defmodule IFriend do
  alias IFriend.Config
  require Logger

  def start(_,_) do
    run_once()
    {:ok, self()}
  end

  def run_once do
    hello()
    :init.stop
  end

  def hello do
    greet(greet_count())
  end

  def greet(max, count \\ 0)
  def greet(max, count) when count > max , do: :ok
  def greet(max, count) do
    greet_medium().output(greeter())
    greet(max, count + 1)
  end

  def greeter, do: Config.get(:IFriend, :greeter)
  def greet_count do
    Config.get(:IFriend, :greeting)
    |> Access.get(:max)
    |> Integer.parse
    |> (fn {i, _}-> i end).()
  end

  defp greet_medium do
    Config.get(:IFriend, :greet_medium_adapter)
  end
end
