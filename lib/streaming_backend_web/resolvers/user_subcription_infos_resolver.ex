defmodule StreamingBackendWeb.Resolvers.UserSubcriptionInfosResolver do
  alias StreamingBackend.Streamings
  alias StreamingBackend.Accounts
  alias StreamingBackendWeb.Schema.ChangesetErrors

  def get_user_subcription_infos(_, _, _) do
    user_subcription_infos = Streamings.get_all_user_subscription_infos()
    {:ok, user_subcription_infos}
  end

  def create_user_subscription_info(_, %{user_id: user_id, streaming_account_id: streaming_account_id, input: post_params}, _) do
    user = Accounts.get_user!(user_id)
    streaming_account = Streamings.get_streaming_account!(streaming_account_id)
    case Streamings.create_user_subscription_info(user, streaming_account, post_params ) do
      {:ok, user_subcription_infos} ->
        {:ok, user_subcription_infos}

      {:error, %Ecto.Changeset{} = changeset} ->
        {
          :error,
          message: "No hemos podido crear la cuenta de streaming.",
          details: ChangesetErrors.error_details(changeset)
        }
    end
  end
end
