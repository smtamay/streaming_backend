defmodule StreamingBackend.Streamings do
  @moduledoc """
  The Streamings context.
  """

  import Ecto.Query, warn: false
  alias StreamingBackend.Repo

  alias StreamingBackend.Streamings.StreamingPlataform
  alias StreamingBackend.Accounts

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
  def create_streaming_plataform(name \\ %{}) do
    %StreamingPlataform{}
    |> StreamingPlataform.changeset(%{name: name})
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

  alias StreamingBackend.Streamings.StreamingAccount

  @doc """
  Returns the list of streaming_accounts.

  ## Examples

      iex> list_streaming_accounts()
      [%StreamingAccount{}, ...]

  """
  def list_streaming_accounts do
    Repo.all(StreamingAccount)
  end

  def get_all_streaming_accounts do
    StreamingAccount
    |> join(:inner, [sa], sp in assoc(sa, :streaming_plataform))
    |> select([sa, sp], %{
      id: sa.id,
      price: sa.price,
      email: sa.email,
      password: sa.password,
      payment_date: sa.payment_date,
      streaming_plataform: sp.name
    })
    |> Repo.all()
  end


  @doc """
  Gets a single streaming_account.

  Raises `Ecto.NoResultsError` if the Streaming account does not exist.

  ## Examples

      iex> get_streaming_account!(123)
      %StreamingAccount{}

      iex> get_streaming_account!(456)
      ** (Ecto.NoResultsError)

  """
  def get_streaming_account!(id), do: Repo.get!(StreamingAccount, id)

  @doc """
  Creates a streaming_account.

  ## Examples

      iex> create_streaming_account(%{field: value})
      {:ok, %StreamingAccount{}}

      iex> create_streaming_account(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_streaming_account(%StreamingPlataform{} = streaming_plataform, attrs \\ %{}) do
    %StreamingAccount{}
    |> StreamingAccount.changeset(attrs)
    |> Ecto.Changeset.put_assoc(:streaming_plataform, streaming_plataform)
    |> Repo.insert()
  end

  @doc """
  Updates a streaming_account.

  ## Examples

      iex> update_streaming_account(streaming_account, %{field: new_value})
      {:ok, %StreamingAccount{}}

      iex> update_streaming_account(streaming_account, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_streaming_account(%StreamingAccount{} = streaming_account, attrs) do
    streaming_account
    |> StreamingAccount.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a streaming_account.

  ## Examples

      iex> delete_streaming_account(streaming_account)
      {:ok, %StreamingAccount{}}

      iex> delete_streaming_account(streaming_account)
      {:error, %Ecto.Changeset{}}

  """
  def delete_streaming_account(%StreamingAccount{} = streaming_account) do
    Repo.delete(streaming_account)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking streaming_account changes.

  ## Examples

      iex> change_streaming_account(streaming_account)
      %Ecto.Changeset{data: %StreamingAccount{}}

  """
  def change_streaming_account(%StreamingAccount{} = streaming_account, attrs \\ %{}) do
    StreamingAccount.changeset(streaming_account, attrs)
  end

  alias StreamingBackend.Streamings.UserSubscriptionInfo

  @doc """
  Returns the list of user_subscription_infos.

  ## Examples

      iex> list_user_subscription_infos()
      [%UserSubscriptionInfo{}, ...]

  """
  def list_user_subscription_infos do
    Repo.all(UserSubscriptionInfo)
  end

  @doc """
  Gets a single user_subscription_info.

  Raises `Ecto.NoResultsError` if the User subscription info does not exist.

  ## Examples

      iex> get_user_subscription_info!(123)
      %UserSubscriptionInfo{}

      iex> get_user_subscription_info!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user_subscription_info!(id), do: Repo.get!(UserSubscriptionInfo, id)

  def get_all_user_subscription_infos do
    UserSubscriptionInfo
    |> join(:inner, [usi], u in assoc(usi, :user))
    |> join(:inner, [usi, u], sa in assoc(usi, :streaming_account))
    |> join(:inner, [usi, u, sa], sp in assoc(sa, :streaming_plataform))
    |> select([usi, u, sa, sp], %{
      id: usi.id,
      plataform: sp.name,
      admin: u.username,  # Utiliza directamente la asociación :user
      user: usi.name,
      price: usi.price,
      start_date: usi.start_date,
      end_date: usi.end_date,
      payment_date: usi.payment_date,
      status: usi.status,
    })
    |> Repo.all()
  end

  @doc """
  Creates a user_subscription_info.

  ## Examples

      iex> create_user_subscription_info(%{field: value})
      {:ok, %UserSubscriptionInfo{}}

      iex> create_user_subscription_info(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user_subscription_info(%Accounts.User{} = user, %StreamingAccount{} = streaming_account, attrs \\ %{}) do
    %UserSubscriptionInfo{}
    |> UserSubscriptionInfo.changeset(attrs)
    |> Ecto.Changeset.put_assoc(:user, user)
    |> Ecto.Changeset.put_assoc(:streaming_account, streaming_account)
    |> Repo.insert()
  end

  @doc """
  Updates a user_subscription_info.

  ## Examples

      iex> update_user_subscription_info(user_subscription_info, %{field: new_value})
      {:ok, %UserSubscriptionInfo{}}

      iex> update_user_subscription_info(user_subscription_info, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user_subscription_info(%UserSubscriptionInfo{} = user_subscription_info, attrs) do
    user_subscription_info
    |> UserSubscriptionInfo.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user_subscription_info.

  ## Examples

      iex> delete_user_subscription_info(user_subscription_info)
      {:ok, %UserSubscriptionInfo{}}

      iex> delete_user_subscription_info(user_subscription_info)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user_subscription_info(%UserSubscriptionInfo{} = user_subscription_info) do
    Repo.delete(user_subscription_info)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user_subscription_info changes.

  ## Examples

      iex> change_user_subscription_info(user_subscription_info)
      %Ecto.Changeset{data: %UserSubscriptionInfo{}}

  """
  def change_user_subscription_info(%UserSubscriptionInfo{} = user_subscription_info, attrs \\ %{}) do
    UserSubscriptionInfo.changeset(user_subscription_info, attrs)
  end
end
