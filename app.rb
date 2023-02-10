require "roda"

require "amazing_print"
AmazingPrint.defaults = {
  indent: 2,
  index:  false,
}

class App < Roda

  plugin :sessions, secret: ?a * 64
  plugin :json
  plugin :render, engine: "slim"

  route do |r|
    r.root do
      { status: :OK, message: "api working"}
    end

    r.is "dropdown" do
      view "dropdown"
    end

    r.is "frameworks" do
      frameworks_list = {
        "Ruby" => %w[Roda Hanami Rails],
        "Python" => %w[Django Flask],
        "JavaScript" => %w[Express AngularJS]
      }
      view "frameworks", locals: { frameworks: frameworks_list.fetch(r.params["language"]) }
    end

    r.is "search" do
      %w[uno dos tres cuatro]
    end
  end
end
