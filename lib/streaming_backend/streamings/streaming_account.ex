defmodule StreamingBackend.Streamings.StreamingAccount do
  use Ecto.Schema
  import Ecto.Changeset

  schema "streaming_accounts" do
    field :password, :string
    field :price, :float
    field :email, :string
    field :payment_date, :date

    belongs_to :streaming_plataform, StreamingBackend.Streamings.StreamingPlataform
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(streaming_account, attrs) do
    streaming_account
    |> cast(attrs, [:price, :email, :password, :payment_date])
    |> validate_required([:price, :email, :password, :payment_date])
  end
end
