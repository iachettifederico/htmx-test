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
  plugin :render, engine: "slim"
  plugin :all_verbs

  USERS = [
    {
      "id"         => "1",
      "first_name" => "Fede",
      "last_name"  => "Iache",
      "email"      => "fede@example.com",
    },
  ]

  route do |r|

    puts "  >>>>> #{__FILE__}:#{__LINE__}".purple
    ap r.params
    puts "  >>>>> #{__FILE__}:#{__LINE__}".purple


    r.root do
      Contacts.new(USERS).call
    end

    r.on "contact" do
      r.on :id do |id|
        user = USERS.find { |user| user["id"] == "1" }

        r.is "edit" do
          ContactForm.new(user).call
        end

        r.put do
          user.inspect
        end
      end
    end
  end
end
