require 'rails_helper.rb'

RSpec.describe User, type: :model do
    let(:test_user) { User.create(name: 'Example User', password: 'secret', password_confirmation: 'secret') }
    let(:subject) do
        described_class.new(
            email: "test1@mail.com",
            created_at: "2020-09-21 22:35:32",
            updated_at: "2020-09-21 22:35:32",
            username: "test1"
        )
    end


  describe 'associations' do
    it { should have_many(:articles) }
    it { should have_many(:votes) }
    it { should have_many(:bookmarks) }

  end

  describe 'validations' do
    it {should validate_presence_of(:username)}
    it {should validate_uniqueness_of(:username)}
    it {should validate_presence_of(:email)}
    it {should allow_value("test@mail.com").for(:email)}
    it {should_not allow_value("test").for(:email)}
    it {should allow_value("123456").for(:password)}
    it {should_not allow_value("123").for(:password)}
  end


end