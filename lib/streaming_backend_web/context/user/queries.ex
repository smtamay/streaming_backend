defmodule StreamingBackendWeb.Context.User.Queries do
  alias StreamingBackendWeb.Resolvers.UserResolver
  use Absinthe.Schema.Notation

  object :user_queries do
    @desc "Get current user"
    field :me, :user do
      resolve(&UserResolver.me/3)
    end
  end
end
