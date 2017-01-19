require 'test_helper'

class UserTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:tom)
  end

  test "logged in should be able to see news form" do

    sign_in users(:tom)
    get "/news/new"
    assert_response :success
  
  end

  test "can create a news report" do
  
    sign_in users(:tom)
    get "/news/new"
  
    post "/news",
      params: { news: { title: "soham", summary: "this summary,", 
                text: "this text", date: "2017-01-13", online: true } }
    follow_redirect!

    assert_select "p", "Title:\n  soham"
  
  end

  test "can edit a news report" do

    sign_in users(:tom)
    put "/news/1",
      params: { news: { title: "test", summary: "this summary,", 
                text: "this text", date: "2017-01-13", online: true} }
    follow_redirect!

    assert_select "p", "Title:\n  test"

  end  

  test "can delete a news report" do
    sign_in users(:tom)
    delete "/news/1"
    follow_redirect!

    assert_select "td", false, "ABC"
  end

  test "can log out" do 
    sign_in users(:tom)
    delete "/users/sign_out"
    assert_redirected_to root_path

  end  
end
