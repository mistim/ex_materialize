defmodule Materialize do
  @assets_struct """
    project_dir
    ...
    |--assets
      |--static
        |--fonts
          |--***
      |--vendor
        |--materialize
          |--css
            |--materialize.css
            |--materialize.min.css
          |--js
            |--materialize.js
            |--materialize.min.js
    ...
  """
  @brach_conf """
    # add JQuery
    npm: {
      enabled: true,
      globals: {
        $: 'jquery',
        jQuery: 'jquery'
      }
    }
"""

  @moduledoc """
  This package install [materialize-css](http://materializecss.com/getting-started.html) to you project.

  ## Installation

  If [available in Hex](https://hex.pm/docs/publish), the package can be installed
  by adding `materialize` to your list of dependencies in `mix.exs`:

  ```elixir
  def deps do
    [{:materialize, "~> #{Materialize.Mixfile.get_version}"}]
  end
  ```

  Next you need get deps:

  ```shell
  $ mix deps.get
  ```

  And run mix task:

  ```shell
  $ mix materialize.install
  ```

  ### Result

  Task **materialize.install** do next:

  * npm - run npm install materialize-css --save-dev
  * dist - copy js, css files to *assets/vendor/materialize*
  * fonts  - copy dir fonts to *assets/static*

  After install you have next structure in the folder *assets*:

  ```
  #{@assets_struct}
  ```

  Comment out or delete the contents of the file **assets/css/phoenix.css**

  If you are using a brunch, change the file assets/brunch-config.js:

  ```
  #{@brach_conf}
  ```

  Use **materialize-css** in you template project: [Documentations](https://hexdocs.pm/materialize/Materialize.html)

  Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
  and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
  be found at [https://hexdocs.pm/materialize](https://hexdocs.pm/materialize).

  """

  def assets_struct do
    @assets_struct
  end

  def brach_conf do
    @brach_conf
  end

  @doc """
  The paths to look for template files for generators.

  Defaults to checking the current app's priv directory,
  and falls back to phoenix's priv directory.
  """
  def generator_paths do
    [".", :materialize]
  end
end
