require 'rails_helper.rb'

RSpec.describe Vote, type: :model do
  

  describe 'validations with subject' do
    before(:each) do
      art1.image.attach(io: File.open(Rails.root.join('spec', 'models', 'images', 'default.jpg')),
                        filename: 'default.jpg',
                        content_type: 'image/jpg')
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
