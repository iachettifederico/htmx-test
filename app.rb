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

  USERS = %w[tito toto tete tita tota tato].each_with_object({}) { |slug, users_hash|
    users_hash[slug] = {
      "slug"   => slug,
      "name"   => slug.capitalize,
      "email"  => "#{slug}@example.com",
      "status" => "active",
    }
  }

  route do |r|

    puts "  >>>>> #{__FILE__}:#{__LINE__}".purple
    ap r.params
    puts "  >>>>> #{__FILE__}:#{__LINE__}".purple


    r.root do
      Landing.new(USERS.values).call
    end

    r.on "contact" do
      r.on :slug do |slug|
        user = USERS.fetch(slug)

        r.root do
          ContactCard.new(user).call
        end

        r.is "edit" do
          ContactForm.new(user).call
        end

        r.put do
          USERS[slug] = r.params

          ContactCard.new(USERS[slug]).call
        end
      end
    end

    r.is "change_status", :status do |status|
      r.params["slugs"].each do |slug|
        USERS[slug]["status"] = status
      end

      ap USERS
      
      StatusRows.new(USERS.values).call
    end
  end
end
