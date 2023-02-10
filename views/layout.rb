require "phlex"

class Layout < Phlex::HTML
  register_element :di

  def template(&block)
    html do
      head do
        title { "HTMX test" }
        script(src: "https://unpkg.com/htmx.org@1.7.0")
        link(rel: "stylesheet", href: "https://rsms.me/inter/inter.css")
        link(
          rel: "stylesheet",
          href:
            "https://cdn.jsdelivr.net/npm/selekkt-skelet@latest/css/skelet.min.css"
        )
      end
      body do
        block.call
      end
    end
  end
end
