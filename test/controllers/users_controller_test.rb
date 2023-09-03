require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "create" do
    assert_difference "User.count", 1 do
      post "/users.json", params: { first_name: "Test", last_name: "Test", email: "test@test.com", password: "password", password_confirmation: "password", city: "Test City", state: "Test State", zipcode: 1111 }
      assert_response 201
    end
  end
end
