require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  let(:user) do
    User.create(
      email: 'testee@mail.com',
      created_at: '2020-09-21 22:35:32',
      updated_at: '2020-09-21 22:35:32',
      username: 'testee',
      password: '123456',
      password_confirmation: '123456'
    )
  end
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
  let(:art1) do
    Article.create(
      title: 'Test Title for tests',
      text: 'This is a long text, to test the article',
      author_id: user.id,
      categories_list: [cat1.id, cat2.id]
    )
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:article) }
  end

  describe 'validations' do
    it { should validate_uniqueness_of(:user_id).scoped_to(:article_id) }
  end

  describe 'Bookmarks attributes' do
    before(:each) do
      art1.image.attach(io: File.open(Rails.root.join('spec', 'models', 'images', 'default.jpg')),
                        filename: 'default.jpg', content_type: 'image/jpg')
      art1.save
    end
    it 'should be valid with valid attributes' do
      bookmark = described_class.create(article_id: art1.id,
                                        user_id: user.id)
      expect(bookmark).to be_valid
    end

    it 'should have article foreign keys' do
      bookmark = described_class.create(article_id: nil,
                                        user_id: user.id)
      expect(bookmark).to_not be_valid
    end

    it 'should have user foreign keys' do
      bookmark = described_class.create(article_id: art1.id,
                                        user_id: nil)
      expect(bookmark).to_not be_valid
    end

    it 'each combination of foreign keys should be unique' do
      described_class.create(article_id: art1.id,
                             user_id: user.id)
      bookmark_copy = described_class.create(article_id: art1.id,
                                             user_id: user.id)
      expect(bookmark_copy).to_not be_valid
    end
  end
end
