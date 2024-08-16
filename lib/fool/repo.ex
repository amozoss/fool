defmodule Fool.Repo do
  use Ecto.Repo,
    otp_app: :fool,
    adapter: Ecto.Adapters.Postgres
end
