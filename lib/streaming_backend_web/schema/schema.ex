defmodule StreamingBackendWeb.Schema.Schema do
  use Absinthe.Schema

  # Import types
  import_types StreamingBackendWeb.Context.User.Types
  import_types StreamingBackendWeb.Context.StreamingPlataform.Types

  # Import queries
  import_types StreamingBackendWeb.Context.User.Queries
  import_types StreamingBackendWeb.Context.StreamingPlataform.Queries

  # Import mutations
  import_types StreamingBackendWeb.Context.User.Mutations
  import_types StreamingBackendWeb.Context.StreamingPlataform.Mutations

  query do
   import_fields :user_queries

   import_fields :streaming_plataform_queries
  end


  mutation do
   import_fields :user_mutations

   import_fields :streaming_plataform_mutations
  end
end
