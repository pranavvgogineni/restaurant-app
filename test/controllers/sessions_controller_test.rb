require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "create" do
    post "/users.json", params: { first_name: "Test", last_name: "Test", email: "test@test.com", password: "password", password_confirmation: "password", city: "Test City", state: "Test State", zipcode: 1111 }
    post "/sessions.json", params: { email: "test@test.com", password: "password" }
    assert_response 201

    data = JSON.parse(response.body)
    assert_equal ["jwt", "email", "user_id"], data.keys
  end
end
