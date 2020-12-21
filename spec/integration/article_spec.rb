require 'rails_helper'

describe 'articles', type: :feature do
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
  end

  it 'Should have a call to create a new article' do
    visit '/'
    expect(page).to have_content 'Please create a new article'
  end

  it 'should render a form to create a new article' do
    expect(page).to have_content 'New Article'
  end

  it 'should render a form to create a new article' do
    expect(page).to have_content 'New Article'
  end

  it 'should render a form to create a new article' do
    expect(page).to have_content 'New Article'
  end

  it 'should have an error if Title is not present' do
    click_button 'Create Article'
    expect(page).to have_content 'Title is too short (minimum is 10 characters)'
  end

  it 'should have an error if Text is not present' do
    click_button 'Create Article'
    expect(page).to have_content 'Text is too short (minimum is 15 characters)'
  end

  it 'should have an error if no category was choosen' do
    click_button 'Create Article'
    expect(page).to have_content "Categories list can't be blank"
  end

  it 'should have an error if no category was choosen' do
    click_button 'Create Article'
    expect(page).to have_content "Categories list can't be blank"
  end

  it 'should not have an error category was choosen' do
    all('input[type=checkbox]').each(&:click)
    click_button 'Create Article'
    expect(page).to_not have_content "Categories list can't be blank"
  end

  it 'should not have an error message with valid attributes' do
    all('input[type=checkbox]').each(&:click)
    fill_in 'article_title', with: 'Test Article'
    fill_in 'article_text', with: 'This is a Test Article. It can be saved.'
    click_button 'Create Article'
    expect(page).to_not have_content 'prohibited this article from being saved'
  end

  it 'new article should be on the first page' do
    all('input[type=checkbox]').each(&:click)
    fill_in 'article_title', with: 'Test Article'
    fill_in 'article_text', with: 'This is a Test Article. It can be saved.'
    click_button 'Create Article'
    visit '/'
    expect(page).to have_content 'Test Article'
  end

  it 'new article should be on the category page' do
    all('input[type=checkbox]').each(&:click)
    fill_in 'article_title', with: 'Test Article'
    fill_in 'article_text', with: 'This is a Test Article. It can be saved.'
    click_button 'Create Article'
    visit '/'
    click_link 'Test'
    expect(page).to have_content 'This is a Test Article. It can be saved.'
  end
end
