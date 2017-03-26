defmodule AlpacaCompiler.Mixfile do
  use Mix.Project

  def project do
    [app: :alpaca_compiler,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     compilers: Mix.compilers ++ [:alpaca],
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :epo_runtime]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:alpaca_lib, git: "https://github.com/alpaca-lang/alpaca_lib", branch: "master"},
     {:alpaca, git: "https://github.com/alpaca-lang/alpaca", branch: "master", manager: :rebar3, override: true}]
  end
end