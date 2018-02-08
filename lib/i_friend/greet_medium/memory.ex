defmodule IFriend.GreetMedium.Memory do
  @behaviour IFriend.GreetMedium
  use Agent

  def start_link do
    Agent.start_link(fn -> [] end, name: __MODULE__)
  end

  def output(message) do
    case Process.whereis(__MODULE__) do
      nil -> start_link()
      output(message)
      _ -> Agent.update(__MODULE__, fn messages -> [message | messages] end)
    end
  end

  def sent_messages do
    Agent.get(__MODULE__, fn messages -> messages end)
  end
end
