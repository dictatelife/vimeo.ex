defmodule Vimeo.Mixfile do
  use Mix.Project

  def project do
    [
      app: :vimeo,
      version: "0.0.2",
      elixir: "~> 1.1",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps(),
      description: description(),
      package: package(),
      docs: [extras: ["README.md"]],
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [coveralls: :test]
    ]
  end

  # Configuration for the OTP application
  def application do
    [applications: app_list(Mix.env)]
  end

  defp app_list(:dev), do: [:dotenv | app_list()]
  defp app_list(:test), do: [:dotenv | app_list()]
  defp app_list(_), do: app_list()
  defp app_list, do: [:logger, :httpoison]

  defp deps do
    [
      {:httpoison, "~> 2.1"},
      {:poison, "~> 5.0"},
      {:earmark, "~> 1.4", only: [:dev, :docs]},
      {:ex_doc, "~> 0.30.3", only: [:dev, :docs]},
      {:inch_ex, "~> 2.0.0", only: [:dev, :docs]},
      {:excoveralls, "~> 0.16.1", only: [:dev, :test]},
      {:exvcr, "~> 0.14.1", only: [:dev, :test]},
      {:dotenv, "~> 3.1", only: [:dev, :test]},
      {:credo, "~> 1.7", only: [:dev, :test]}
    ]
  end

  defp description do
    """
    Vimeo API v3 client library for Elixir.
    """
  end

  defp package do
    [
      maintainers: ["dictatelife"],
      licenses: ["MIT"],
      links: %{"Github" => "https://github.com/dictatelife/vimeo.ex"}
    ]
  end
end
