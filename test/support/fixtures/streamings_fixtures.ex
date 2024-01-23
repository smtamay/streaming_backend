defmodule StreamingBackend.StreamingsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `StreamingBackend.Streamings` context.
  """

  @doc """
  Generate a streaming_plataform.
  """
  def streaming_plataform_fixture(attrs \\ %{}) do
    {:ok, streaming_plataform} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> StreamingBackend.Streamings.create_streaming_plataform()

    streaming_plataform
  end
end
