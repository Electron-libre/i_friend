defmodule IFriend.Config do
  @spec get(atom, atom, term | nil) :: term
  def get(app, key, default \\ nil) when is_atom(app) and is_atom(key) do
    case read_config(Application.get_env(app, key)) do
      nil -> default
      val -> val
    end
  end

  def read_config({:system, var_name}), do: System.get_env(var_name)
  def read_config({:system, var_name, default}) do
    case System.get_env(var_name) do
      nil -> default
      val -> val
    end
  end
  def read_config(list) when is_list(list) do
    Enum.reduce(list, [], fn(e, acc) ->  [ read_config(e) | acc] end)
  end

  def read_config({subconfig, val}) when is_atom(subconfig), do: {subconfig, read_config(val)}
  def read_config(other), do: other


  @spec get_cast(:integer, atom(), atom(), integer()) :: integer
  def get_cast(:integer, app, key, default \\ nil) do
    case get(app, key, default) do
      val when is_integer(val) -> val
      val -> with {i, ""} <- Integer.parse(val)
          do
          i
          else
            err -> raise ArgumentError, message: ~s"""
            Error parsing Config value for #{app}, #{key} :
            #{err} does not seem to be valid integer
            """
        end
    end
  end
end
