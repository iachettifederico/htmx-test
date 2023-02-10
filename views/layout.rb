require "phlex"

class Layout < Phlex::HTML
  def template(&block)
    html do
      head do
        title { "HTMX test" }
        script(src: "https://unpkg.com/htmx.org@1.7.0")

        link(
          rel: "stylesheet",
          href: "https://unpkg.com/@picocss/pico@1.*/css/pico.min.css"
        )
      end

      body do
        block.call
      end
    end
  end
end
