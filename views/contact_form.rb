class ContactForm < Layout
  def initialize(user)
    @user = user
  end

  def template
    super do
      form(hx_put: "/contact/#{user["slug"]}", hx_target: "this", hx_swap: "outerHTML") do
        input(name: "slug", value: user["slug"], type: "hidden")
        div do
          label { "Name" }
          input(name: "name", value: user["name"])
        end
        div(class: "form-group") do
          label { "Email Address" }
          input(type: "email", name: "email", value: user["email"])
        end
        div(class: "form-group") do
          label { "Status" }
          select(name: "status") do
            option(value: "active", selected: user["status"] == "active")     { "Active" }
            option(value: "inactive", selected: user["status"] == "inactive") { "Inactive" }
          end
        end
        button(class: "btn") { "Submit" }
        button(class: "btn", hx_get: "/contact/#{user["slug"]}/") { "Cancel" }
      end
    end
  end

  private

  attr_reader :user
end
