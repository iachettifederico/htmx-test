class ContactForm < Layout
  def initialize(user)
    @user = user
  end

  def template
    super do
      form(hx_put: "/contact/#{user["id"]}", hx_target: "this", hx_swap: "outerHTML") do
        input(name: "id", value: user["id"], type: "hidden")
        div do
          label { "First Name" }
          input(name: "first_name", value: user["first_name"])
        end
        div(class: "form-group") do
          label { "Last Name" }
          input(name: "last_name", value: user["last_name"])
        end
        div(class: "form-group") do
          label { "Email Address" }
          input(type: "email", name: "email", value: user["email"])
        end
        button(class: "btn") { "Submit" }
        button(class: "btn", hx_get: "/contact/#{user["id"]}/") { "Cancel" }
      end
    end
  end

  private

  attr_reader :user
end
