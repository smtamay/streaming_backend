defmodule StreamingBackendWeb.Context.UserSubscriptionInfo.Types do
  use Absinthe.Schema.Notation

  @desc "The user_subscription_info entity type"
  object :user_subscription_info do
    field :id, :id
    field :user_id, :id
    field :streaming_account_id, :id
    field :name, :string
    field :price, :float
    field :start_date, :string
    field :end_date, :string
    field :payment_date, :string
    field :status, :string
    field :inserted_at, :string
    field :updated_at, :string
  end

  @desc "The user_subscription_infos list"
  object :user_subscription_infos do
    field :id, :id
    field :plataform, :string
    field :admin, :string
    field :user, :string
    field :price, :float
    field :start_date, :string
    field :end_date, :string
    field :payment_date, :string
    field :status, :string
  end

  @desc "The user_subscription_info for create new account"
  input_object :user_subscription_info_input do
    field :name, :string
    field :price, :float
    field :start_date, :string
    field :end_date, :string
    field :payment_date, :string
    field :status, :string
  end
end
