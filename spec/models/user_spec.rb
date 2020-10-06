require 'rails_helper.rb'

RSpec.describe User, type: :model do
  @user = User.create(
    email: 'tests@mail.com',
    created_at: '2020-09-21 22:35:32',
    updated_at: '2020-09-21 22:35:32',
    username: 'tests',
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
  let(:subject) do
    described_class.create(
      email: 'testx@mail.com',
      created_at: '2020-09-21 22:35:32',
      updated_at: '2020-09-21 22:35:32',
      username: 'testx',
      password: '123456',
      password_confirmation: '123456'
    )
  end

  describe 'associations' do
    it { should have_many(:articles) }
    it { should have_many(:votes) }
    it { should have_many(:bookmarks) }
  end

  describe 'validations' do
    it { should validate_presence_of(:username) }

    it { should validate_uniqueness_of(:username) }

    it { should validate_presence_of(:email) }

    it { should allow_value('test@mail.com').for(:email) }

    it { should_not allow_value('test').for(:email) }

    it { should allow_value('123456').for(:password) }

    it { should_not allow_value('123').for(:password) }
  end

  describe 'Validation with Subject' do
    it 'Validation of attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.username = ''
      expect(subject).to_not be_valid
    end

    it "is not valid if password and confirmation doesn't match" do
      subject.password = '123456'
      subject.password_confirmation = '654321'
      expect(subject).to_not be_valid
    end

    it 'is valid with a valid email' do
      subject.email = 'valid@mail.com'
      expect(subject).to be_valid
    end

    it 'is not valid without email' do
      subject.email = ''
      expect(subject).to_not be_valid
    end
  end
end
