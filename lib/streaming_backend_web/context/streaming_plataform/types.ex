defmodule StreamingBackendWeb.Context.StreamingPlataform.Types do
  use Absinthe.Schema.Notation

  @desc "The streaming_plataform entity type"
  object :streaming_plataform do
    field :id, :id
    field :name, non_null(:string)
    field :inserted_at, :string
    field :updated_at, :string
  end
end
