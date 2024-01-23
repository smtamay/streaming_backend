defmodule StreamingBackendWeb.Context.StreamingPlataform.Mutations do
  alias StreamingBackendWeb.Resolvers.StreamingPlataformResolver
  use Absinthe.Schema.Notation

  object :streaming_plataform_mutations do
    @desc "Create a streaming_plataform account"
    field :create_streaming_plataform, :streaming_plataform do
      arg(:name, non_null(:string))
      resolve(&StreamingPlataformResolver.create_streaming_plataform/3)
    end
  end

end
