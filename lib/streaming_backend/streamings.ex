defmodule StreamingBackend.Streamings do
  @moduledoc """
  The Streamings context.
  """

  import Ecto.Query, warn: false
  alias StreamingBackend.Repo

  alias StreamingBackend.Streamings.StreamingPlataform

  @doc """
  Returns the list of streaming_plataforms.

  ## Examples

      iex> list_streaming_plataforms()
      [%StreamingPlataform{}, ...]

  """
  def list_streaming_plataforms do
    Repo.all(StreamingPlataform)
  end

  @doc """
  Gets a single streaming_plataform.

  Raises `Ecto.NoResultsError` if the Streaming plataform does not exist.

  ## Examples

      iex> get_streaming_plataform!(123)
      %StreamingPlataform{}

      iex> get_streaming_plataform!(456)
      ** (Ecto.NoResultsError)

  """
  def get_streaming_plataform!(id), do: Repo.get!(StreamingPlataform, id)

  @doc """
  Creates a streaming_plataform.

  ## Examples

      iex> create_streaming_plataform(%{field: value})
      {:ok, %StreamingPlataform{}}

      iex> create_streaming_plataform(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_streaming_plataform(attrs \\ %{}) do
    %StreamingPlataform{}
    |> StreamingPlataform.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a streaming_plataform.

  ## Examples

      iex> update_streaming_plataform(streaming_plataform, %{field: new_value})
      {:ok, %StreamingPlataform{}}

      iex> update_streaming_plataform(streaming_plataform, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_streaming_plataform(%StreamingPlataform{} = streaming_plataform, attrs) do
    streaming_plataform
    |> StreamingPlataform.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a streaming_plataform.

  ## Examples

      iex> delete_streaming_plataform(streaming_plataform)
      {:ok, %StreamingPlataform{}}

      iex> delete_streaming_plataform(streaming_plataform)
      {:error, %Ecto.Changeset{}}

  """
  def delete_streaming_plataform(%StreamingPlataform{} = streaming_plataform) do
    Repo.delete(streaming_plataform)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking streaming_plataform changes.

  ## Examples

      iex> change_streaming_plataform(streaming_plataform)
      %Ecto.Changeset{data: %StreamingPlataform{}}

  """
  def change_streaming_plataform(%StreamingPlataform{} = streaming_plataform, attrs \\ %{}) do
    StreamingPlataform.changeset(streaming_plataform, attrs)
  end
end
