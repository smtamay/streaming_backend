defmodule StreamingBackendWeb.Context.User.Types do
  use Absinthe.Schema.Notation

  @desc "The user entity type"
  object :user do
    field :id, :id
    field :email, non_null(:string)
    field :role, :string
    field :inserted_at, non_null(:string)
  end

  @desc "Entity type for user"
  object :session do
    field :user, non_null(:user)
    field :token, non_null(:string)
  end

end
