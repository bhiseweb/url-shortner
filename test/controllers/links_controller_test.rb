require "test_helper"

class LinksControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @link = links(:one)
    @user = users(:one)
  end

  test "should get index" do
    sign_in(@user)
    get links_url
    assert_response :success
  end

  test "should get new" do
    sign_in(@user)
    get new_link_url
    assert_response :success
  end

  test "should create link" do
    sign_in(@user)
    assert_difference("Link.count") do
      post links_url, params: { link: { clicks: @link.clicks, main_url: @link.main_url, token: @link.token, user_id: @link.user_id } }
    end

    assert_redirected_to link_url(Link.last)
  end

  test "should show link" do
    sign_in(@user)
    get link_url(@link)
    assert_response :success
  end

  test "should explore link" do
    sign_in(@user)
    get "#{root_path}/#{@link.token}"
    assert_redirected_to @link.main_url
  end
end
