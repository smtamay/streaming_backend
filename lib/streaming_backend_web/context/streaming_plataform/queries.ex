defmodule StreamingBackendWeb.Context.StreamingPlataform.Queries do
  alias StreamingBackendWeb.Resolvers.StreamingPlataformResolver
  use Absinthe.Schema.Notation

  object :streaming_plataform_queries do
    @desc "Get all streaming_plataforms"
    field :get_list_streaming_plataforms, list_of(:streaming_plataform) do
      resolve(&StreamingPlataformResolver.get_list_streaming_plataforms/3)
    end
  end
end
