require "test_helper"

class SavedSearchesControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/saved_searches.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal SavedSearch.count, data.length
  end

  test "create" do
    assert_difference "SavedSearch.count", 1 do
      user = User.create(first_name: "Test", last_name: "Test", email: "test@test.com", password: "password", password_confirmation: "password", city: "Test City", state: "Test State", zipcode: 1111)
      post "/saved_searches.json", params: { user_id: user.id, radius: 100, city: "Brookfield", state: "Wisconsin", zip: 53045, price_range: 2, cuisine: "Italian" }
      assert_response 200
    end
  end

  test "show" do
    get "/saved_searches/#{SavedSearch.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "user_id", "radius", "city", "state", "zip", "price_range", "cuisine"], data.keys
  end

  test "update" do
    saved_search = SavedSearch.first
    patch "/saved_searches/#{saved_search.id}.json", params: { city: "Updated city" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated city", data["city"]
  end

  test "destroy" do
    assert_difference "SavedSearch.count", -1 do
      delete "/saved_searches/#{SavedSearch.first.id}.json"
      assert_response 200
    end
  end
end
