require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test "should not save article without title" do
    article = Article.new
    assert_not article.save, "Saved the article without a title"
  end
  test "should save unique title" do
    article = Article.new
    article.title = "MyString"
    assert_not article.save, "Saved an article whose title already existed"
  end
  test "should save a title with length higher than 5" do
    article = Article.new
    article.title = "MySt"
    assert_not article.save, "Saved an article whose title has a lenght smaller than 5"
  end
end
