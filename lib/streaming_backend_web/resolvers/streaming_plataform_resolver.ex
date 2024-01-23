defmodule StreamingBackendWeb.Resolvers.StreamingPlataformResolver do
  alias StreamingBackend.Streamings
  alias StreamingBackendWeb.Schema.ChangesetErrors

  def get_list_streaming_plataforms(_, _, _) do
    {:ok, Streamings.list_streaming_plataforms()}
  end

  def create_streaming_plataform(_, %{name: name}, _) do
    case Streamings.create_streaming_plataform(name) do
      {:ok, streaming_plataform} ->
        {:ok, streaming_plataform}

      {:error, %Ecto.Changeset{} = changeset} ->
        {
          :error,
          message: "No hemos podido crear la plataforma de streaming.",
          details: ChangesetErrors.error_details(changeset)
        }
    end
  end
end
