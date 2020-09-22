require 'rails_helper.rb'

RSpec.describe Bookmark, type: :model do
  
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:article) }
  end

  describe 'validations' do
    it { should validate_uniqueness_of(:user_id).scoped_to(:article_id) }
  end

end