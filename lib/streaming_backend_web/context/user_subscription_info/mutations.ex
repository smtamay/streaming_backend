defmodule StreamingBackendWeb.Context.UserSubscriptionInfo.Mutations do
  use Absinthe.Schema.Notation
  alias StreamingBackendWeb.Resolvers.UserSubcriptionInfosResolver

  object :mutations_user_subscription_info do
    field :create_user_subscription_info, :user_subscription_info do
      arg :user_id, non_null(:id)
      arg :streaming_account_id, non_null(:id)
      arg :input, non_null(:user_subscription_info_input)
      resolve &UserSubcriptionInfosResolver.create_user_subscription_info/3
    end
  end
end
