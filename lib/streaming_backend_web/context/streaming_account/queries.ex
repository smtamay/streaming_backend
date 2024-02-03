defmodule StreamingBackendWeb.Context.StreamingAccount.Queries do
  alias StreamingBackendWeb.Resolvers.StreamingAccountResolver
  use Absinthe.Schema.Notation

  object :streaming_account_queries do
    @desc "Get list of streaming accounts"
    field :list_streaming_accounts, list_of(:streaming_account_info) do
      resolve(&StreamingAccountResolver.get_list_streaming_accounts/3)
    end
  end
end
