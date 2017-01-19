require 'test_helper'

class NewsTest < ActionDispatch::IntegrationTest 
  
  
  test "cannot access new without log in" do 
      get "/news/new"
      assert_redirected_to new_user_session_path
  end    

  test "checking if news fixtures are being loaded" do 
    get "/"
    assert_select "td", "ABC"
  end

end
