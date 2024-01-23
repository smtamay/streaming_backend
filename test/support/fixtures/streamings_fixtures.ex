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

  @doc """
  Generate a streaming_account.
  """
  def streaming_account_fixture(attrs \\ %{}) do
    {:ok, streaming_account} =
      attrs
      |> Enum.into(%{
        email: "some email",
        password: "some password",
        payment_date: ~D[2024-01-22],
        price: 120.5
      })
      |> StreamingBackend.Streamings.create_streaming_account()

    streaming_account
  end
end
