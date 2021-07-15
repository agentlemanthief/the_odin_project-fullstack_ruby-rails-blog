require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  test 'Should not save without a title' do
    article = Article.new
    assert_not article.save
  end

  test 'Should not save without a body' do
    article = Article.new(title: 'Test')
    assert_not article.save
  end

  test 'Should save with title and body' do
    article = Article.new(title: 'Test', body: 'Test body long enough')
    assert article.save
  end

  test 'Should not save when body is too short' do
    article = Article.new(title: 'Test', body: 'Too short')
    assert_not article.save
  end
end
