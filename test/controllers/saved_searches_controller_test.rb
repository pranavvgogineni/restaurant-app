require "test_helper"

class SavedSearchesControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/saved_searches.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal SavedSearch.count, data.length
  end
end
