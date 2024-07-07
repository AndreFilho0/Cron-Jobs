import Config

config :cron_jobs, MyApp.Application,
  port: String.to_integer(System.get_env("PORT") || "4000")
