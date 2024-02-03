defmodule StreamingBackendWeb.Resolvers.StreamingAccountResolver do
  alias StreamingBackend.Streamings
  alias StreamingBackendWeb.Schema.ChangesetErrors

  def get_list_streaming_accounts(_, _, _) do
    {:ok, Streamings.list_streaming_accounts()}
  end

  def create_streaming_account(_, %{streaming_plataform_id: streaming_plataform_id, input: post_params}, _) do
    streaming_plataform = Streamings.get_streaming_plataform!(streaming_plataform_id)
    case Streamings.create_streaming_account(streaming_plataform, post_params ) do
      {:ok, streaming_account} ->
        {:ok, streaming_account}

      {:error, %Ecto.Changeset{} = changeset} ->
        {
          :error,
          message: "No hemos podido crear la cuenta de streaming.",
          details: ChangesetErrors.error_details(changeset)
        }
    end
  end
end
