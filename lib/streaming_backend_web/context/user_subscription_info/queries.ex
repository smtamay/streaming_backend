defmodule StreamingBackendWeb.Context.UserSubscriptionInfo.Queries do
  use Absinthe.Schema.Notation
  alias StreamingBackendWeb.Resolvers.UserSubcriptionInfosResolver

  object :queries_subscription_info do
    field :get_user_subcription_infos, list_of(:user_subscription_infos) do
      resolve &UserSubcriptionInfosResolver.get_user_subcription_infos/3
    end
  end
end
