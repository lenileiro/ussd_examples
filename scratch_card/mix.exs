defmodule ScratchCard.MixProject do
  use Mix.Project

  def project do
    [
      app: :scratch_card,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {ScratchCard.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_ussd, git: "https://github.com/beamkenya/ex_ussd.git", branch: "develop"},
      {:plug, "~> 1.9"},
      {:cowboy, "~> 2.7"},
      {:plug_cowboy, "~> 2.1.2"},
      {:jason, "~> 1.2"}
    ]
  end
end