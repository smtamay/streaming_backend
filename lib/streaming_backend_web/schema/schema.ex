defmodule StreamingBackendWeb.Schema.Schema do
  use Absinthe.Schema
  import_types StreamingBackendWeb.Context.User.Types
  import_types StreamingBackendWeb.Context.User.Mutations
  import_types StreamingBackendWeb.Context.User.Queries

  query do
   import_fields :hello
  end


  mutation do
   import_fields :signup
  end
end
