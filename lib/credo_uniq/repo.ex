defmodule CredoUniq.Repo do
  use Ecto.Repo,
    otp_app: :credo_uniq,
    adapter: Ecto.Adapters.Postgres
end
