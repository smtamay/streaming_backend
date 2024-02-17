defmodule StreamingBackendWeb.Schema.Schema do
  use Absinthe.Schema

  # Import types
  import_types StreamingBackendWeb.Context.User.Types
  import_types StreamingBackendWeb.Context.StreamingPlataform.Types
  import_types StreamingBackendWeb.Context.StreamingAccount.Types
  import_types StreamingBackendWeb.Context.UserSubscriptionInfo.Types

  # Import queries
  import_types StreamingBackendWeb.Context.User.Queries
  import_types StreamingBackendWeb.Context.StreamingPlataform.Queries
  import_types StreamingBackendWeb.Context.StreamingAccount.Queries
  import_types StreamingBackendWeb.Context.UserSubscriptionInfo.Queries

  # Import mutations
  import_types StreamingBackendWeb.Context.User.Mutations
  import_types StreamingBackendWeb.Context.StreamingPlataform.Mutations
  import_types StreamingBackendWeb.Context.StreamingAccount.Mutations
  import_types StreamingBackendWeb.Context.UserSubscriptionInfo.Mutations

  query do
   import_fields :user_queries

   import_fields :streaming_plataform_queries

   import_fields :streaming_account_queries

   import_fields :queries_subscription_info
  end


  mutation do
   import_fields :user_mutations

   import_fields :streaming_plataform_mutations

   import_fields :streaming_account_mutations

   import_fields :mutations_user_subscription_info
  end
end
