defmodule IFriendTest do
  use ExUnit.Case
  doctest IFriend

  test "greets the world" do
    assert IFriend.hello() == :world
  end

  test "greets n times" do
    assert IFriend.Config.get(:IFriend, :greet_medium_adapter).sent_messages().count = IFriend.Config.get(:IFriend, :greet, :max)
  end
end
