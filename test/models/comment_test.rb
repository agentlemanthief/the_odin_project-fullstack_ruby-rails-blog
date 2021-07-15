require "test_helper"

class CommentTest < ActiveSupport::TestCase
  test 'Should save with commentor and body' do
    article = Article.create(title: 'Test title', body: 'Test body message')
    comment = article.comments.new(commenter: 'testman', body: 'Test body message')
    assert comment.save
  end

  test 'Should not save without a commentor' do
    comment = Comment.new
    assert_not comment.save
  end

  test 'Should not save without a body' do
    comment = Comment.new(commenter: 'testman')
    assert_not comment.save
  end
end
