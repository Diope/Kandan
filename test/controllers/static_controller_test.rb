require 'test_helper'

class StaticControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
    assert_template 'static/home'
  end

  test "should get about" do
    get :about
    assert_response :success
    assert_template 'static/about'
  end

  test "should get contact" do
    get :contact
    assert_response :success
    assert_template 'static/contact'
  end

end
