class ContactCard < Layout
  def initialize(user)
    @user = user
  end

  def template
    super do
      article(hx_target: "this", hx_swap: "outerHTML") do
        div do
          span { "Name: " }
          span { user["name"] }
        end
        div do
          span { "Email: " }
          span { user["email"] }
        end
        div do
          span { "Status: " }
          span { user["status"] }
        end


        button(hx_get: "/contact/#{user["slug"]}/edit", class: "btn btn-primary") do
          "Click To Edit"
        end
      end
    end
  end

  private

  attr_reader :user
end
