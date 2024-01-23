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

  describe "streaming_accounts" do
    alias StreamingBackend.Streamings.StreamingAccount

    import StreamingBackend.StreamingsFixtures

    @invalid_attrs %{password: nil, price: nil, email: nil, payment_date: nil}

    test "list_streaming_accounts/0 returns all streaming_accounts" do
      streaming_account = streaming_account_fixture()
      assert Streamings.list_streaming_accounts() == [streaming_account]
    end

    test "get_streaming_account!/1 returns the streaming_account with given id" do
      streaming_account = streaming_account_fixture()
      assert Streamings.get_streaming_account!(streaming_account.id) == streaming_account
    end

    test "create_streaming_account/1 with valid data creates a streaming_account" do
      valid_attrs = %{password: "some password", price: 120.5, email: "some email", payment_date: ~D[2024-01-22]}

      assert {:ok, %StreamingAccount{} = streaming_account} = Streamings.create_streaming_account(valid_attrs)
      assert streaming_account.password == "some password"
      assert streaming_account.price == 120.5
      assert streaming_account.email == "some email"
      assert streaming_account.payment_date == ~D[2024-01-22]
    end

    test "create_streaming_account/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Streamings.create_streaming_account(@invalid_attrs)
    end

    test "update_streaming_account/2 with valid data updates the streaming_account" do
      streaming_account = streaming_account_fixture()
      update_attrs = %{password: "some updated password", price: 456.7, email: "some updated email", payment_date: ~D[2024-01-23]}

      assert {:ok, %StreamingAccount{} = streaming_account} = Streamings.update_streaming_account(streaming_account, update_attrs)
      assert streaming_account.password == "some updated password"
      assert streaming_account.price == 456.7
      assert streaming_account.email == "some updated email"
      assert streaming_account.payment_date == ~D[2024-01-23]
    end

    test "update_streaming_account/2 with invalid data returns error changeset" do
      streaming_account = streaming_account_fixture()
      assert {:error, %Ecto.Changeset{}} = Streamings.update_streaming_account(streaming_account, @invalid_attrs)
      assert streaming_account == Streamings.get_streaming_account!(streaming_account.id)
    end

    test "delete_streaming_account/1 deletes the streaming_account" do
      streaming_account = streaming_account_fixture()
      assert {:ok, %StreamingAccount{}} = Streamings.delete_streaming_account(streaming_account)
      assert_raise Ecto.NoResultsError, fn -> Streamings.get_streaming_account!(streaming_account.id) end
    end

    test "change_streaming_account/1 returns a streaming_account changeset" do
      streaming_account = streaming_account_fixture()
      assert %Ecto.Changeset{} = Streamings.change_streaming_account(streaming_account)
    end
  end
end
