defmodule StreamingBackend.Streamings.StreamingPlataform do
  use Ecto.Schema
  import Ecto.Changeset

  schema "streaming_plataforms" do
    field :name, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(streaming_plataform, attrs) do
    streaming_plataform
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
