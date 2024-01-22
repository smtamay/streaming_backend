defmodule StreamingBackendWeb.Context.User.Queries do
  use Absinthe.Schema.Notation

  object :hello do
    @desc "Hello world"
    field :hello, :string do
      resolve(fn _, _ ->
        {:ok, "Hola, mundo!"}
      end)
    end
  end
end
