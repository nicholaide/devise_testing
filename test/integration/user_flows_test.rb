require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  test "login and browse site" do
    get "/"
    assert_response :redirect
    assert_redirected_to(controller: "devise/sessions", action: "new")
    
    user_hash = {"user"=>{"email"=> users(:the_admin).email, "password"=>"skyfall_spectre"} }
    post_via_redirect "/users/sign_in", user_hash
    assert_equal '/books', path
  end
  
end