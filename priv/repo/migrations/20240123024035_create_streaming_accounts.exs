defmodule StreamingBackend.Repo.Migrations.CreateStreamingAccounts do
  use Ecto.Migration

  def change do
    create table(:streaming_accounts) do
      add :streaming_platform_id, references(:streaming_plataforms, on_delete: :nothing)
      add :price, :float
      add :email, :string
      add :password, :string
      add :payment_date, :date

      timestamps(type: :utc_datetime)
    end

    create index(:streaming_accounts, [:streaming_platform_id])
  end
end
