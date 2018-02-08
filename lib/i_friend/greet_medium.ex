defmodule IFriend.GreetMedium do
  @callback output(String.t) :: {:ok} | {:error}
end
