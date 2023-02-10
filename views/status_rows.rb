class StatusRows < Phlex::HTML
  def initialize(users)
    @users = users
  end

  def template
    users.each do |user|
      tr(class: "") do
        td { input(type: "checkbox", name: "slugs[]", value: user["slug"]) }
        td { user["name"] }
        td { user["email"] }
        td { user["status"] }
      end
    end
  end

  private

  attr_reader :users
end
