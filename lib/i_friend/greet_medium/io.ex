defmodule IFriend.GreetMedium.IO do
  @behaviour IFriend.GreetMedium

  def output(message) do
    IO.puts(message)
  end
end
