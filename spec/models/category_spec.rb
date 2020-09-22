require 'rails_helper.rb'

RSpec.describe Category, type: :model do
    let(:subject) do
        described_class.new(
            name: 'Reviews',
            priority: 3
        )
    end

  describe 'associations' do
    it { should have_and_belong_to_many(:articles) }
  end

  describe 'validation' do
    it {should validate_presence_of(:name) }
    it {should validate_presence_of(:priority) }
  end

  describe 'validation of subject attributes' do
    it 'should be valid with valid attributes' do
        expect(subject).to be_valid
    end
    it 'should be invalid without priority' do
        subject.priority = nil
        expect(subject).to_not be_valid
    end
    it 'should be invalid without priority' do
        subject.name = ''
        expect(subject).to_not be_valid
    end
  end


end