require 'rails_helper.rb'

describe 'categories', type: :feature do
  before :each do
    visit 'users/sign_up'
    fill_in 'user_username', with: 'cattest'
    fill_in 'user_email', with: 'cattest@mail.com'
    fill_in 'user_password', with: '123456'
    fill_in 'user_password_confirmation', with: '123456'
    click_button 'Sign up'
  end

  it 'should render de form to create a new category' do
    visit '/categories/new'
    expect(page).to have_content 'New Category'
  end

  it 'should render de form to create a new article with the new category' do
    visit '/categories/new'
    fill_in 'category_name', with: 'Test'
    fill_in 'category_priority', with: '20'
    click_button 'Create Category'
    expect(page).to have_content 'Test'
  end

  it 'index page should have the new category' do
    visit '/categories/new'
    fill_in 'category_name', with: 'Test'
    fill_in 'category_priority', with: '20'
    click_button 'Create Category'
    visit '/'
    expect(page).to have_content 'Test'
  end

  it 'Should have success message with valid attributes' do
    visit '/categories/new'
    fill_in 'category_name', with: 'Test'
    fill_in 'category_priority', with: '20'
    click_button 'Create Category'
    expect(page).to have_content 'Category was successfully created.'
  end

  it 'Should not have error message with valid attributes' do
    visit '/categories/new'
    fill_in 'category_name', with: 'Test'
    fill_in 'category_priority', with: '20'
    click_button 'Create Category'
    expect(page).to_not have_content "Priority can't be blank"
  end

  it 'Should have error message with blank priority' do
    visit '/categories/new'
    fill_in 'category_name', with: 'Test'
    click_button 'Create Category'
    expect(page).to have_content "Priority can't be blank"
  end

  it 'Should have error message with blank name' do
    visit '/categories/new'
    fill_in 'category_priority', with: '20'
    click_button 'Create Category'
    expect(page).to have_content "Name can't be blank"
  end
end
