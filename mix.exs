defmodule FileInfo.Mixfile do
  use Mix.Project

  def project do
    [
      app: :file_info,
      version: "0.0.2",
      description: "Get MIME-type of a file by its magic number (linux only)",
      elixir: "~> 1.0",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package()
    ]
  end

  defp package do
    [
      maintainers: ["Norbert \"NobbZ\" Melzer"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/NobbZ/file_info"}
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
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
    [
      {:mimetype_parser, "~> 0.1.2"},
      {:ex_doc, "~> 0.11", only: :dev},
      {:earmark, "~> 0.1", only: :dev},
      {:credo, "~> 0.3.7", only: :dev},
      {:inch_ex, "~> 0.5.1", only: :dev}
    ]
  end
end
