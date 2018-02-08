defmodule IFriend.GreetMedium.SMS do
  import HTTPoison
  @behaviour IFriend.GreetMedium

  # Imagine we use a real sms gateway
  def output(message) do
    HTTPoison.post("https://an.sms.gateway.example", %{to: "+033612345678", message: message})
  end
end
