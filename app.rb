require "roda"
require "amazing_print"
AmazingPrint.defaults = {
  indent: 2,
  index:  false,
}

require "amazing_print"
AmazingPrint.defaults = {
  indent: 2,
  index:  false,
}

require "./views/layout"
Dir["./views/*.rb"].entries.each do |file|
  require file
end

class App < Roda

  plugin :sessions, secret: ?a * 64
  plugin :json
  plugin :render, engine: "slim"

  USERS = {
    "1" => {
      "first_name" => "Fede",
      "last_name"  => "Iache",
      "email"      => "fede@example.com"
    }
  }

  route do |r|

    puts "  >>>>> #{__FILE__}:#{__LINE__}".purple
    ap r.params
    puts "  >>>>> #{__FILE__}:#{__LINE__}".purple

    r.root do
      Contact.new.call
    end

  end
end
