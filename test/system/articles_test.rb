require "application_system_test_case"

class ArticlesTest < ApplicationSystemTestCase
  test "Viewing the index" do
    visit articles_path

    assert_selector "h1", text: "Blog Posts"
  end

  test 'Creating an article' do
    visit articles_path

    click_on 'New Article'

    fill_in 'Title', with: 'Creating an article'
    fill_in "Body",	with: "Created this article successfully!"

    click_on 'Create Article'

    assert_text 'Thank you for your post!'
  end
end
