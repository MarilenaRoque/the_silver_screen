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
    fill_in 'user_username', with: 'test1'
    fill_in 'user_email', with: 'test1@mail.com'
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
    expect(page).to have_content 'test1'
  end
end

describe 'Display most voted Article', type: :feature do
  @user = User.create(
    email: 'test1@mail.com',
    created_at: '2020-09-21 22:35:32',
    updated_at: '2020-09-21 22:35:32',
    username: 'test1',
    password: '123456',
    password_confirmation: '123456'
  )

  let(:cat1) do
    Category.create(
      name: 'Reviews',
      priority: 3
    )
  end
  let(:cat2) do
    Category.create(
      name: 'Actions',
      priority: 2
    )
  end

  it 'Vote Valid' do
    visit 'users/sign_in'
    fill_in 'user_username', with: 'test1'
    fill_in 'user_password', with: '123456'
    click_button 'Log in'
    @article = Article.new(
      title: 'Test Title for tests',
      text: 'This is a long text, to test the article',
      author_id: user.id,
      categories_list: [cat1.id, cat2.id]
    )
    @article.image.attach(io: File.open(Rails.root.join('spec', 'models', 'images', 'default.jpg')),
                          filename: 'default.jpg',
                          content_type: 'image/jpg')
    @article.save

    @vote = Vote.create(
      user_id: user.id,
      article_id: @article.id
    )
    expect(vote).to be_valid
  end

  it 'Display created category' do
    visit '/'
    expect(page).to have_content 'Actions'
  end

  it 'Display created category' do
    visit '/'
    expect(page).to have_content 'Reviews'
  end

  it 'Display prev of the text of the most voted' do
    visit '/'
    expect(page).to have_content 'This is a long text, to test the article'
  end
end
