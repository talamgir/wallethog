require 'test_helper'

class CardsControllerTest < ActionController::TestCase
  test "should get entercard" do
    get :entercard
    assert_response :success
  end

  test "should get cardentered" do
    get :cardentered
    assert_response :success
  end

end
