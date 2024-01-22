defmodule StreamingBackendWeb.Context.User.Mutations do
  alias StreamingBackendWeb.Resolvers.UserResolver
  use Absinthe.Schema.Notation

    object :signup do
        @desc "Create a user account"
        field :signup, :session do
          arg :email, non_null(:string)
          arg :username, non_null(:string)
          arg :password, non_null(:string)
          resolve &UserResolver.signup/3
        end
    end
end
