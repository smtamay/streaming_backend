defmodule StreamingBackend.Streamings.UserSubscriptionInfo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user_subscription_infos" do
    field :name, :string
    field :status, :string
    field :price, :float
    field :start_date, :date
    field :end_date, :date
    field :payment_date, :date

    belongs_to :user, StreamingBackend.Accounts.User
    belongs_to :streaming_account, StreamingBackend.Streamings.StreamingAccount
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user_subscription_info, attrs) do
    user_subscription_info
    |> cast(attrs, [:name, :price, :start_date, :end_date, :payment_date, :status])
    |> validate_required([:name, :price, :start_date, :end_date, :payment_date, :status])
  end
end
