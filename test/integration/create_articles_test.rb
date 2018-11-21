require 'test_helper'

class CreateArticlesTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create(username: "Jared Goff", email: "jared@gmail.com", password: "password", admin: true)
  end

  test "create article test" do
    sign_in_as(@user, "password")

    get new_article_path
    assert_template 'articles/new'
    assert_difference 'Article.count', 1 do
      post articles_path, params: {article: {title: "Greatest of all time", description: "kobe bryant, tom brady, tiger woods"}}
      follow_redirect!
    end
    assert_template 'articles/show'
    assert_match "Greatest of all time", response.body
  end

end