class BulkUpdate < Phlex::HTML
  def initialize(users)
    @users = users
  end

  def template
    article do

      div(hx_include: "#checked-contacts", hx_target: "#tbody") do
        button(hx_put: "/change_status/active")   { "Activate" }
        button(hx_put: "/change_status/inactive") { "Deactivate" }
      end

      form(id: "checked-contacts") do
        table do
          thead do
            tr do
              th
              th { "Name" }
              th { "Email" }
              th { "Status" }
            end
          end

          tbody(id: "tbody") do
            unsafe_raw StatusRows.new(users).call
          end
        end
      end
    end
    
  end

  private

  attr_reader :users
end
