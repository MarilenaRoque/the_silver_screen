require 'rails_helper.rb'

describe 'required authentication', type: :feature do
  it 'Should require authetication when root is accessed' do
    visit '/'
    expect(page).to have_content 'You need to sign in or sign up before continuing'
  end

  it 'Navbar should not have the link to Home' do
    visit '/'
    expect(page).to_not have_content 'Home'
  end

  it 'Navbar should not have the link to Bookmarks' do
    visit '/'
    expect(page).to_not have_content 'Bookmarks'
  end

  it 'Navbar should not have the link to Create Article' do
    visit '/'
    expect(page).to_not have_content 'Create Article'
  end
end

describe 'Authenticated User access', type: :feature do
  before :each do
    visit 'users/sign_up'
    fill_in 'user_username', with: 'mari'
    fill_in 'user_email', with: 'mari@mail.com'
    fill_in 'user_password', with: '123456'
    fill_in 'user_password_confirmation', with: '123456'
    click_button 'Sign up'
  end

  it 'Navbar should have the link to Home' do
    expect(page).to have_content 'HOME'
  end

  it 'Navbar should have the link to Bookmarks' do
    expect(page).to have_content 'BOOKMARKS'
  end

  it 'Navbar should have the link to Create Article' do
    expect(page).to have_content 'CREATE ARTICLE'
  end

  it 'Navbar should have username on navbar' do
    expect(page).to have_content 'mari'
  end
end
