defmodule Materialize.InputHelpers do
  use Phoenix.HTML

  def input(form, field, opts \\ []) do
    type = opts[:using] || Phoenix.HTML.Form.input_type(form, field)
    label_value = opts[:label] || humanize(field)

    wrapper_opts = [class: "input-field #{state_class(form, field)}"]
    label_opts = [class: "#{state_class(form, field, "", "red-text")}"]
    input_opts = [class: "#{state_class(form, field, "", "invalid mb5")}"]

    content_tag :div, wrapper_opts do
      label = label(form, field, label_value, label_opts)
      input = input(type, form, field, input_opts)
      error = error_tag(form, field, "error-block red-text mb10 ib") || ""
      [label, input, error]
    end
  end

  defp state_class(form, field, has_success \\ "", class_error \\ "has-error red-text") do
    cond do
      # The form was not yet submitted
      !form.source.action -> ""
      form.errors[field] -> class_error
      # form.source.valid? -> has_success
      true -> has_success
    end
  end

  # Implement clauses below for custom inputs.
  # defp input(:datepicker, form, field, input_opts) do
  #   raise "not yet implemented"
  # end

  defp input(type, form, field, input_opts) do
    apply(Phoenix.HTML.Form, type, [form, field, input_opts])
  end

  @doc """
  Generates tag for inlined form input errors.
  """
  def error_tag(form, field, class \\ "error-block") do
    Enum.map(Keyword.get_values(form.errors, field), fn (error) ->
      # content_tag :span, translate_error(error), class: class
      content_tag :span, error, class: class
    end)
  end
end