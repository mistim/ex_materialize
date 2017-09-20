defmodule NavbarTest do
  use ExUnit.Case

  import Materialize.Components.Navbar
  import Phoenix.HTML

  doctest Materialize.Components.Navbar

  test "when set full options, attributes set as keywords" do
    opts = [
      [:wrap, [class: "nav-wrapper"], [class: "col s12"]],
      [:logo, "Custom Logo", [href: "#", class: "brand-logo"]],
      [:ul, [
        [:a, "list 1", [href: "#1"]],
        [:a, "list 2", [href: "#2"]]
      ], [id: "nav-mobile", class: "right hide-on-med-and-down"]]
    ]

    assert safe_to_string(get_html(opts)) == ~s(<nav>) <>
      ~s(<div class="nav-wrapper">) <>
      ~s(<div class="col s12">) <>
      ~s(<a class="brand-logo" href="#">Custom Logo</a>) <>
      ~s(<ul class="right hide-on-med-and-down" id="nav-mobile">) <>
      ~s(<li><a href="#1">list 1</a></li>) <>
      ~s(<li><a href="#2">list 2</a></li>) <>
      ~s(</ul>) <>
      ~s(</div>) <>
      ~s(</div>) <>
      ~s(</nav>)
  end

  test "when set minimum options, attributes set as keywords" do
    opts = [
      [:ul, [
        [:a, "list 1", [href: "#1"]],
        [:a, "list 2", [href: "#2"]]
      ]]
    ]

    assert safe_to_string(get_html(opts)) == ~s(<nav>) <>
      ~s(<div class="nav-wrapper">) <>
      ~s(<a class="brand-logo" href="#">Logo</a>) <>
      ~s(<ul class="right hide-on-med-and-down" id="nav-mobile">) <>
      ~s(<li><a href="#1">list 1</a></li>) <>
      ~s(<li><a href="#2">list 2</a></li>) <>
      ~s(</ul>) <>
      ~s(</div>) <>
      ~s(</nav>)
  end

  test "when set full options, attributes set as tuples, except wrapper" do
    opts = [
      [:wrap, [class: "nav-wrapper"], [class: "col s12"]],
      [:logo, "Custom Logo", class: "brand-logo", href: "#custom"],
      [:ul, [
        [:a, "list 1", href: "#1"],
        [:a, "list 2", href: "#2"]
      ], id: "nav-mobile", class: "right hide-on-med-and-down"]
    ]

    assert safe_to_string(get_html(opts)) == ~s(<nav>) <>
      ~s(<div class="nav-wrapper">) <>
      ~s(<div class="col s12">) <>
      ~s(<a class="brand-logo" href="#custom">Custom Logo</a>) <>
      ~s(<ul class="right hide-on-med-and-down" id="nav-mobile">) <>
      ~s(<li><a href="#1">list 1</a></li>) <>
      ~s(<li><a href="#2">list 2</a></li>) <>
      ~s(</ul>) <>
      ~s(</div>) <>
      ~s(</div>) <>
      ~s(</nav>)
  end

  test "when set minimum options, attributes set as tuples" do
    opts = [
      [:ul, [
        [:a, "list 1", href: "#1"],
        [:a, "list 2", href: "#2"]
      ]]
    ]

    assert safe_to_string(get_html(opts)) == ~s(<nav>) <>
      ~s(<div class="nav-wrapper">) <>
      ~s(<a class="brand-logo" href="#">Logo</a>) <>
      ~s(<ul class="right hide-on-med-and-down" id="nav-mobile">) <>
      ~s(<li><a href="#1">list 1</a></li>) <>
      ~s(<li><a href="#2">list 2</a></li>) <>
      ~s(</ul>) <>
      ~s(</div>) <>
      ~s(</nav>)
  end

  test "when set options without logo, some wrappers" do
    opts = [
      [:wrap, [class: "nav-wrapper"], [class: "col s12"]],
      [:ul, [
        [:a, "list 1", [href: "#1"]],
        [:a, "list 2", [href: "#2"]]
      ], id: "nav-mobile", class: "right hide-on-med-and-down"]
    ]

    assert safe_to_string(get_html(opts)) == ~s(<nav>) <>
      ~s(<div class="nav-wrapper">) <>
      ~s(<div class="col s12">) <>
      ~s(<a class="brand-logo" href="#">Logo</a>) <>
      ~s(<ul class="right hide-on-med-and-down" id="nav-mobile">) <>
      ~s(<li><a href="#1">list 1</a></li>) <>
      ~s(<li><a href="#2">list 2</a></li>) <>
      ~s(</ul>) <>
      ~s(</div>) <>
      ~s(</div>) <>
      ~s(</nav>)
  end

  test "when set options without logo, one wrapper without default class" do
    opts = [
      [:wrap, [id: "nav-wrapper"]],
      [:ul, [
        [:a, "list 1", [href: "#1"]],
        [:a, "list 2", [href: "#2"]]
      ]]
    ]

    assert safe_to_string(get_html(opts)) == ~s(<nav>) <>
      ~s(<div class="nav-wrapper" id="nav-wrapper">) <>
      ~s(<a class="brand-logo" href="#">Logo</a>) <>
      ~s(<ul class="right hide-on-med-and-down" id="nav-mobile">) <>
      ~s(<li><a href="#1">list 1</a></li>) <>
      ~s(<li><a href="#2">list 2</a></li>) <>
      ~s(</ul>) <>
      ~s(</div>) <>
      ~s(</nav>)
  end

  test "when set options without wrapper and logo with custom class" do
    opts = [
      [:logo, class: "custom"],
      [:ul, [
        [:a, "list 1", [href: "#1"]],
        [:a, "list 2", [href: "#2"]]
      ]]
    ]

    assert safe_to_string(get_html(opts)) == ~s(<nav>) <>
      ~s(<div class="nav-wrapper">) <>
      ~s(<a class="custom" href="#">Logo</a>) <>
      ~s(<ul class="right hide-on-med-and-down" id="nav-mobile">) <>
      ~s(<li><a href="#1">list 1</a></li>) <>
      ~s(<li><a href="#2">list 2</a></li>) <>
      ~s(</ul>) <>
      ~s(</div>) <>
      ~s(</nav>)
  end

  test "when set options wrapper with custom class and logo with custom href" do
    opts = [
      [:wrap, [class: "custom", id: "nav-wrapper"]],
      [:logo, href: "#custom"],
      [:ul, [
        [:a, "list 1", [href: "#1"]],
        [:a, "list 2", [href: "#2"]]
      ]]
    ]

    assert safe_to_string(get_html(opts)) == ~s(<nav>) <>
      ~s(<div class="custom" id="nav-wrapper">) <>
      ~s(<a class="brand-logo" href="#custom">Logo</a>) <>
      ~s(<ul class="right hide-on-med-and-down" id="nav-mobile">) <>
      ~s(<li><a href="#1">list 1</a></li>) <>
      ~s(<li><a href="#2">list 2</a></li>) <>
      ~s(</ul>) <>
      ~s(</div>) <>
      ~s(</nav>)
  end

  test "when set minimum options, attributes set as tuples, set option mobile_collapse is true" do
    opts = [
      [:options, mobile_collapse: true],
      [:ul, [
        [:a, "list 1", href: "#1"],
        [:a, "list 2", href: "#2"]
      ]]
    ]

    assert safe_to_string(get_html(opts)) == ~s(<nav>) <>
      ~s(<div class="nav-wrapper">) <>
      ~s(<a class="brand-logo" href="#">Logo</a>) <>
      ~s(<a class="button-collapse" data-activates="mobile-collapse" href="#"><i class="material-icons">menu</i></a>) <>
      ~s(<ul class="right hide-on-med-and-down" id="nav-mobile">) <>
      ~s(<li><a href="#1">list 1</a></li>) <>
      ~s(<li><a href="#2">list 2</a></li>) <>
      ~s(</ul>) <>
      ~s(<ul class="side-nav" id="mobile-collapse">) <>
      ~s(<li><a href="#1">list 1</a></li>) <>
      ~s(<li><a href="#2">list 2</a></li>) <>
      ~s(</ul>) <>
      ~s(</div>) <>
      ~s(</nav>)
  end

  test "when set minimum options, attributes set as tuples, set option mobile_collapse is false" do
    opts = [
      [:options, mobile_collapse: false],
      [:ul, [
        [:a, "list 1", href: "#1"],
        [:a, "list 2", href: "#2"]
      ]]
    ]

    assert safe_to_string(get_html(opts)) == ~s(<nav>) <>
      ~s(<div class="nav-wrapper">) <>
      ~s(<a class="brand-logo" href="#">Logo</a>) <>
      ~s(<ul class="right hide-on-med-and-down" id="nav-mobile">) <>
      ~s(<li><a href="#1">list 1</a></li>) <>
      ~s(<li><a href="#2">list 2</a></li>) <>
      ~s(</ul>) <>
      ~s(</div>) <>
      ~s(</nav>)
  end

  test "when set class for tag :nav" do
    opts = [
      [:options, mobile_collapse: false],
      [:nav, class: "green lighten-2", role: "navigation"],
      [:ul, [
        [:a, "list 1", href: "#1"],
        [:a, "list 2", href: "#2"]
      ]]
    ]

    assert safe_to_string(get_html(opts)) == ~s(<nav class="green lighten-2" role="navigation">) <>
      ~s(<div class="nav-wrapper">) <>
      ~s(<a class="brand-logo" href="#">Logo</a>) <>
      ~s(<ul class="right hide-on-med-and-down" id="nav-mobile">) <>
      ~s(<li><a href="#1">list 1</a></li>) <>
      ~s(<li><a href="#2">list 2</a></li>) <>
      ~s(</ul>) <>
      ~s(</div>) <>
      ~s(</nav>)
  end
end