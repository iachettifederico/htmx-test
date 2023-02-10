class Contact < Layout
  def initialize(user)
    @user = user
  end

  def template
    super do
      div(hx_target: "this", hx_swap: "outerHTML") do
        div do
          label { "First Name" }
          text ": #{user["first_name"]}"
        end
        div do
          label { "Last Name" }
          text ": #{user["last_name"]}"
        end
        div do
          label { "Email" }
          text ": #{user["email"]}"
        end

        button(hx_get: "/contact/#{user["id"]}/edit", class: "btn btn-primary") do
          " Click To Edit "
        end
      end
    end
  end

  private

  attr_reader :user
end
