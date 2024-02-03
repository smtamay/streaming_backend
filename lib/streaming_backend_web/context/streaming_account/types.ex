defmodule StreamingBackendWeb.Context.StreamingAccount.Types do
  use Absinthe.Schema.Notation

  @desc "The streaming_account entity type"
  object :streaming_account do
    field :id, :id
    field :streaming_plataform_id, :id
    field :price, :float
    field :email, :string
    field :password, :string
    field :payment_date, :string
    field :inserted_at, :string
    field :updated_at, :string
  end

  @desc "The streaming_account for create new account"
  input_object :streaming_account_input do
    field :price, :float
    field :email, :string
    field :password, :string
    field :payment_date, :string
  end
end
