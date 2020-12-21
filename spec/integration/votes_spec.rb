require 'rails_helper'

describe 'votes', type: :feature do
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
    Vote.create(user_id: User.first.id,
                article_id: Article.first.id)
    expect(vote).to be_valid
  end

  it 'Voted article should be as main article (only main has text on index page)' do
    Vote.create(user_id: User.first.id,
                article_id: Article.first.id)
    visit '/'
    expect(page).to have_content 'This is a Test Article. It can be saved.'
  end

  it 'Default main article should disappear if one article has a vote' do
    Vote.create(user_id: User.first.id,
                article_id: Article.first.id)
    visit '/'
    expect(page).to_not have_content 'Do you wanna publish amazing articles'
  end
end
