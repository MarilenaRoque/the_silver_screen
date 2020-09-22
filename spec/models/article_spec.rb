require 'rails_helper.rb'

RSpec.describe Article, type: :model do
  describe 'associations' do
    it { should belong_to(:author).class_name('User') }
    it { should have_many(:votes) }
    it { should have_many(:bookmarks) }
    it { should have_and_belong_to_many(:categories) }
  end
end