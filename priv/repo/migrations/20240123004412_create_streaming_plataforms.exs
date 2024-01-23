defmodule StreamingBackend.Repo.Migrations.CreateStreamingPlataforms do
  use Ecto.Migration

  def change do
    create table(:streaming_plataforms) do
      add :name, :string

      timestamps(type: :utc_datetime)
    end
  end
end
