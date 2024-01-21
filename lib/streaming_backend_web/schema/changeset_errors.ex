defmodule StreamingBackendWeb.Schema.ChangesetErrors do

  def error_details(changeset) do
    Ecto.Changeset.traverse_errors(changeset, fn {msg, opts} ->
      Enum.reduce(opts, msg, fn {key, value}, acc ->
        String.replace(acc, "%{#{key}}", _to_string(value))
      end)
    end)
  end

  defp _to_string(val) when is_list(val) do
    [ last | base_list ]  = Enum.reverse(val)

    base_str  = base_list
    |> Enum.reverse()
    |> Enum.join(", ")

    "#{ base_str }, and #{ last }"
  end

  defp _to_string(val), do: to_string(val)
end
