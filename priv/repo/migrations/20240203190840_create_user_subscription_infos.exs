defmodule StreamingBackend.Repo.Migrations.CreateUserSubscriptionInfos do
  use Ecto.Migration

  def change do
    create table(:user_subscription_infos) do
      add :user_id, references(:users, on_delete: :nothing)
      add :streaming_account_id, references(:streaming_accounts, on_delete: :nothing)
      add :name, :string
      add :price, :float
      add :start_date, :date
      add :end_date, :date
      add :payment_date, :date
      add :status, :string

      timestamps(type: :utc_datetime)
    end

    create index(:user_subscription_infos, [:user_id])
    create index(:user_subscription_infos, [:streaming_account_id])
  end
end
