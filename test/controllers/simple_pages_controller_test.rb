require 'test_helper'

class SimplePagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get simple_pages_index_url
    assert_response :success
  end

end
