defmodule StreamingBackendWeb.Context.StreamingAccount.Mutations do
  alias StreamingBackendWeb.Resolvers.StreamingAccountResolver
  use Absinthe.Schema.Notation

  object :streaming_account_mutations do
    @desc "Create a streaming_account account"
    field :create_streaming_account, :streaming_account do
      arg(:streaming_plataform_id, non_null(:id))
      arg(:input, :streaming_account_input)
      resolve(&StreamingAccountResolver.create_streaming_account/3)
    end
  end
end
