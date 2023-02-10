class Contacts < Layout
  def initialize(users)
    @users = users
  end

  def template
    super do
      h1 { "Contacts" }

      users.map do |user|

        unsafe_raw Contact.new(user).call

      end
    end
  end

  private

  attr_reader :users
end
