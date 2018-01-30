# Materialize

This package install [materialize-css](http://materializecss.com/getting-started.html) to you project.

  ## Installation

  If [available in Hex](https://hex.pm/docs/publish), the package can be installed
  by adding `materialize` to your list of dependencies in `mix.exs`:

  ```elixir
  def deps do
    [{:materialize, "~> 0.3.1"}]
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
  ```

  Comment out or delete the contents of the file **assets/css/phoenix.css**

  If you are using a brunch, change the file assets/brunch-config.js:

  ```
  # add JQuery
  npm: {
    enabled: true,
    globals: {
      $: 'jquery',
      jQuery: 'jquery'
    }
  }
  ```

  Use **materialize-css** in you template project: [Documentations](https://hexdocs.pm/materialize/Materialize.html)