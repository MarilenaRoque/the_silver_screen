require 'rails_helper.rb'

RSpec.describe Vote, type: :model do
  RSpec.describe Article, type: :model do
    let(:user) do
      User.create(
          email: "test1@mail.com",
          created_at: "2020-09-21 22:35:32",
          updated_at: "2020-09-21 22:35:32",
          username: "test1",
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
      described_class.new(
        title: 'Test Title for tests',
        text: 'This is a long text, to test the article',
        author_id: user.id,
        categories_list: [cat1.id, cat2.id]
      )
    end

    let(:art1) do
      described_class.new(
        title: 'Test Title for tests',
        text: 'This is a long text, to test the article',
        author_id: user.id,
        categories_list: [cat1.id, cat2.id]
      )
    end

    describe 'validations with subject' do
      before(:each) do
        art1.image.attach(io: File.open(Rails.root.join('spec', 'models', 'images', 'default.jpg')), filename: 'default.jpg', content_type: 'image/jpg')
      end
    end    

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:article) }
    
  end

  describe 'validations' do
    it { should validate_uniqueness_of(:user_id).scoped_to(:article_id) }
  end


end