class Landing < Layout
  def initialize(users)
    @users = users
  end

  def template
    super do
      h1 { "Contacts" }

      users.each do |user|
        unsafe_raw ContactCard.new(user).call
      end

      hr

      unsafe_raw BulkUpdate.new(users).call
    end
  end

  private

  attr_reader :users
end
