defmodule Pronouncingex.MixProject do
  use Mix.Project

  def project do
    [
      app: :pronouncingex,
      version: "0.1.1",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      package: package(),
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp description do
    """
    get the english (IPA) pronunciation for a word or phrase
    """
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*","cmudict-0.7b.txt"],
      maintainers: ["Carlos L Medina"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/cocodrino/pronouncingex"}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      {:memoize, "~> 1.2"},
      {:ex_doc, ">= 0.0.0"}
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
    ]
  end
end
