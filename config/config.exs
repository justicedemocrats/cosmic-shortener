# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :shorten, Shorten.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "bi+10FTfGA0JOCq8AqQq7dayelDlVi/u3fJ479UIT9UY5bmnBo63p4HBQp1ZEbLB",
  render_errors: [view: Shorten.ErrorView, accepts: ~w(json)],
  pubsub: [name: Shorten.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :shorten, Shorten.Scheduler,
  jobs: [
    {"*/1 * * * *", {Shorten.AirtableCache, :update, []}}
  ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
