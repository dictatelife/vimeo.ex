defmodule Vimeo.Mixfile do
  use Mix.Project

  def project do
    [
      app: :vimeo,
      version: "0.0.2",
      elixir: "~> 1.1",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps,
      description: description,
      package: package,
      docs: [extras: ["README.md"]],
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [coveralls: :test]
    ]
  end

  # Configuration for the OTP application
  def application do
    [applications: app_list(Mix.env)]
  end

  defp app_list(:dev), do: [:dotenv | app_list]
  defp app_list(:test), do: [:dotenv | app_list]
  defp app_list(_), do: app_list
  defp app_list, do: [:logger, :httpoison]

  defp deps do
    [
      {:httpoison, "~> 0.9 or ~> 1.2 or ~> 1.6"},
      {:poison, "~> 1.5 or ~> 2.0 or ~> 3.0 or ~> 4.0"},
      {:earmark, "~> 0.1", only: [:dev, :docs]},
      {:ex_doc, "~> 0.10.0", only: [:dev, :docs]},
      {:inch_ex, "~> 2.0.0", only: [:dev, :docs]},
      {:excoveralls, "~> 0.12.1", only: [:dev, :test]},
      {:exvcr, "~> 0.11.0", only: [:dev, :test]},
      {:dotenv, "~> 2.0.0", only: [:dev, :test]},
      {:credo, "~> 1.1.5", only: [:dev, :test]}
    ]
  end

  defp description do
    """
    Vimeo API v3 client library for Elixir.
    """
  end

  defp package do
    [
      maintainers: ["lilfaf"],
      licenses: ["MIT"],
      links: %{"Github" => "https://github.com/lilfaf/vimeo.ex"}
    ]
  end
end
