defmodule StreamingBackend.StreamingsTest do
  use StreamingBackend.DataCase

  alias StreamingBackend.Streamings

  describe "streaming_plataforms" do
    alias StreamingBackend.Streamings.StreamingPlataform

    import StreamingBackend.StreamingsFixtures

    @invalid_attrs %{name: nil}

    test "list_streaming_plataforms/0 returns all streaming_plataforms" do
      streaming_plataform = streaming_plataform_fixture()
      assert Streamings.list_streaming_plataforms() == [streaming_plataform]
    end

    test "get_streaming_plataform!/1 returns the streaming_plataform with given id" do
      streaming_plataform = streaming_plataform_fixture()
      assert Streamings.get_streaming_plataform!(streaming_plataform.id) == streaming_plataform
    end

    test "create_streaming_plataform/1 with valid data creates a streaming_plataform" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %StreamingPlataform{} = streaming_plataform} = Streamings.create_streaming_plataform(valid_attrs)
      assert streaming_plataform.name == "some name"
    end

    test "create_streaming_plataform/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Streamings.create_streaming_plataform(@invalid_attrs)
    end

    test "update_streaming_plataform/2 with valid data updates the streaming_plataform" do
      streaming_plataform = streaming_plataform_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %StreamingPlataform{} = streaming_plataform} = Streamings.update_streaming_plataform(streaming_plataform, update_attrs)
      assert streaming_plataform.name == "some updated name"
    end

    test "update_streaming_plataform/2 with invalid data returns error changeset" do
      streaming_plataform = streaming_plataform_fixture()
      assert {:error, %Ecto.Changeset{}} = Streamings.update_streaming_plataform(streaming_plataform, @invalid_attrs)
      assert streaming_plataform == Streamings.get_streaming_plataform!(streaming_plataform.id)
    end

    test "delete_streaming_plataform/1 deletes the streaming_plataform" do
      streaming_plataform = streaming_plataform_fixture()
      assert {:ok, %StreamingPlataform{}} = Streamings.delete_streaming_plataform(streaming_plataform)
      assert_raise Ecto.NoResultsError, fn -> Streamings.get_streaming_plataform!(streaming_plataform.id) end
    end

    test "change_streaming_plataform/1 returns a streaming_plataform changeset" do
      streaming_plataform = streaming_plataform_fixture()
      assert %Ecto.Changeset{} = Streamings.change_streaming_plataform(streaming_plataform)
    end
  end
end
