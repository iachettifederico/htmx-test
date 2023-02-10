class Contacts < Layout
  def initialize(users)
    @users = users
  end

  def template
    super do
      h1 { "Contacts" }

      users.each do |user|

        unsafe_raw ContactCard.new(user).call

      end
    end
  end

  private

  attr_reader :users
end
