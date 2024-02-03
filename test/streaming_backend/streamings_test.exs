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

  describe "user_subscription_infos" do
    alias StreamingBackend.Streamings.UserSubscriptionInfo

    import StreamingBackend.StreamingsFixtures

    @invalid_attrs %{name: nil, status: nil, price: nil, start_date: nil, end_date: nil, payment_date: nil}

    test "list_user_subscription_infos/0 returns all user_subscription_infos" do
      user_subscription_info = user_subscription_info_fixture()
      assert Streamings.list_user_subscription_infos() == [user_subscription_info]
    end

    test "get_user_subscription_info!/1 returns the user_subscription_info with given id" do
      user_subscription_info = user_subscription_info_fixture()
      assert Streamings.get_user_subscription_info!(user_subscription_info.id) == user_subscription_info
    end

    test "create_user_subscription_info/1 with valid data creates a user_subscription_info" do
      valid_attrs = %{name: "some name", status: "some status", price: 120.5, start_date: ~D[2024-02-02], end_date: ~D[2024-02-02], payment_date: ~D[2024-02-02]}

      assert {:ok, %UserSubscriptionInfo{} = user_subscription_info} = Streamings.create_user_subscription_info(valid_attrs)
      assert user_subscription_info.name == "some name"
      assert user_subscription_info.status == "some status"
      assert user_subscription_info.price == 120.5
      assert user_subscription_info.start_date == ~D[2024-02-02]
      assert user_subscription_info.end_date == ~D[2024-02-02]
      assert user_subscription_info.payment_date == ~D[2024-02-02]
    end

    test "create_user_subscription_info/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Streamings.create_user_subscription_info(@invalid_attrs)
    end

    test "update_user_subscription_info/2 with valid data updates the user_subscription_info" do
      user_subscription_info = user_subscription_info_fixture()
      update_attrs = %{name: "some updated name", status: "some updated status", price: 456.7, start_date: ~D[2024-02-03], end_date: ~D[2024-02-03], payment_date: ~D[2024-02-03]}

      assert {:ok, %UserSubscriptionInfo{} = user_subscription_info} = Streamings.update_user_subscription_info(user_subscription_info, update_attrs)
      assert user_subscription_info.name == "some updated name"
      assert user_subscription_info.status == "some updated status"
      assert user_subscription_info.price == 456.7
      assert user_subscription_info.start_date == ~D[2024-02-03]
      assert user_subscription_info.end_date == ~D[2024-02-03]
      assert user_subscription_info.payment_date == ~D[2024-02-03]
    end

    test "update_user_subscription_info/2 with invalid data returns error changeset" do
      user_subscription_info = user_subscription_info_fixture()
      assert {:error, %Ecto.Changeset{}} = Streamings.update_user_subscription_info(user_subscription_info, @invalid_attrs)
      assert user_subscription_info == Streamings.get_user_subscription_info!(user_subscription_info.id)
    end

    test "delete_user_subscription_info/1 deletes the user_subscription_info" do
      user_subscription_info = user_subscription_info_fixture()
      assert {:ok, %UserSubscriptionInfo{}} = Streamings.delete_user_subscription_info(user_subscription_info)
      assert_raise Ecto.NoResultsError, fn -> Streamings.get_user_subscription_info!(user_subscription_info.id) end
    end

    test "change_user_subscription_info/1 returns a user_subscription_info changeset" do
      user_subscription_info = user_subscription_info_fixture()
      assert %Ecto.Changeset{} = Streamings.change_user_subscription_info(user_subscription_info)
    end
  end
end
