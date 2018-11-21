require 'test_helper'

class SignInUser < ActionDispatch::IntegrationTest

  def setup
    @user = User.create(username: "Jared Goff", email: "jared@gmail.com", password: "password")
  end

  test "sign in user fails if incorrect password" do
    get users_path
    assert_template 'users/index'

    assert_no_difference 'User.count' do
      sign_in_as(@user, "passWordd")
    end

    assert_template 'sessions/new'

  end

  test "successful sign in user flow test" do
    get users_path
    assert_template 'users/index'

    assert_no_difference 'User.count' do
      sign_in_as(@user, "password")
      follow_redirect!
    end

    assert_template 'users/show'
    assert_match "#{@user.username}", response.body
  end

end