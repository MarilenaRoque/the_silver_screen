require 'rails_helper'

describe 'bookmarks', type: :feature do
  before :each do
    visit 'users/sign_up'
    fill_in 'user_username', with: 'cattest'
    fill_in 'user_email', with: 'cattest@mail.com'
    fill_in 'user_password', with: '123456'
    fill_in 'user_password_confirmation', with: '123456'
    click_button 'Sign up'
    visit '/categories/new'
    fill_in 'category_name', with: 'Test'
    fill_in 'category_priority', with: '20'
    click_button 'Create Category'
    visit '/articles/new'
    all('input[type=checkbox]').each(&:click)
    fill_in 'article_title', with: 'Test Article'
    fill_in 'article_text', with: 'This is a Test Article. It can be saved.'
    click_button 'Create Article'
  end

  it 'vote should be valid with valid attributes' do
    Bookmark.create(user_id: User.last.id,
                    article_id: Article.last.id)
    expect(vote).to be_valid
  end

  it 'Bookmarked article should be displayed on bookmarks index page' do
    Bookmark.create(user_id: User.last.id,
                    article_id: Article.last.id)
    visit '/bookmarks'
    expect(page).to have_content 'This is a Test Article. It can be saved.'
  end

  it 'Default main article should disappear if one article has a vote' do
    visit '/articles/new'
    all('input[type=checkbox]').each(&:click)
    fill_in 'article_title', with: 'Article not bookmarked'
    fill_in 'article_text', with: 'This is a not bookmarked article.'
    click_button 'Create Article'
    visit '/bookmarks'
    expect(page).to_not have_content 'Article not bookmarked'
  end
end
