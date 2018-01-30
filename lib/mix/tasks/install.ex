defmodule Mix.Tasks.Materialize.Install do
	@moduledoc """
	Install materialize package

	```shell
  $ mix materialize.install
  ```

  Comment out or delete the contents of the file **assets/css/phoenix.css**

  If you are using a brunch, change the file **assets/brunch-config.js**:

	```Elixir
    npm: {
      enabled: true,
      globals: {
        $: 'jquery',
        jQuery: 'jquery'
      }
    }
	```
	"""

	# @shortdoc "Install materialize-css"

	use Mix.Task

  @compile if Mix.env == :test, do: :export_all

  @cmd_npm "npm install materialize-css --save-dev"
  @assets_struct """
  project_dir
  ...
  |--assets
      |--static
          |--fonts
              |--***
  ...
  |--assets
      |--vendor
          |--materialize
             |--css
                 |--materialize.css
                 |--materialize.min.css
             |--js
                 |--materialize.js
                 |--materialize.min.js
"""

	@doc "start task"
	def run(_) do
		IO.puts "Install materialize-css"
		do_run()
	end

  def get_assets_struct do
    @assets_struct
  end

	defp do_run do
		npm_install() |> do_assets()
    finish()
	end

	defp npm_install do
		cmd("cd #{Path.absname("assets")} && #{@cmd_npm}")
		cmd("cd ../")
		Path.join(~w(assets node_modules materialize-css dist))
	end

	defp do_assets(npm_dist_path) do
    chek_path(npm_dist_path, "\nTray run: #{@cmd_npm}")

    web_vendor_path = Path.join(~w(assets vendor materialize))
    priv_static_path = Path.join(~w(assets static))

    File.mkdir_p web_vendor_path

    copy_dir_r(npm_dist_path, web_vendor_path, "css")
    copy_dir_r(npm_dist_path, web_vendor_path, "js")
    copy_dir_r(npm_dist_path, priv_static_path, "fonts")

    Mix.shell.info [:white, "* New files copied:"]
    Mix.shell.info [:white, "#{@assets_struct}"]
	end

  defp finish do
    Mix.shell.info [:green, "* The materialize-css installed successful! \n"]
    Mix.shell.info [:white, """
* If you are using a brunch, change the file assets/brunch-config.js:

  # add JQuery
  npm: {
    enabled: true,
    globals: {
      $: 'jquery',
      jQuery: 'jquery'
    }
  }
"""]
  end

  defp cmd(cmd) do
    Mix.shell.info [:green, "* running ", :reset, cmd]
    case Mix.shell.cmd(cmd, quiet: true) do
      0 -> []
      _ -> ["$ #{cmd}"]
    end
  end

	defp copy_dir_r(source_path, dist_path, dir) do
		res_dist_path = Path.join([dist_path, dir])
		File.cp_r(Path.join([source_path, dir]), res_dist_path)
		chek_path res_dist_path
	end

	defp chek_path(path) do
		unless File.exists? path do
			Mix.raise """
			Can't find "#{path}"
			"""
		end
	end

	defp chek_path(path, text) do
		unless File.exists? path do
			Mix.raise """
			Can't find "#{path}" #{text}
			"""
		end
	end

end
