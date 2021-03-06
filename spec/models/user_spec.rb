require 'rails_helper'
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
describe User do
  describe 'factory' do
    let(:user) { FactoryGirl.create :user }
    it { expect(user).to be_valid }
  end

  describe 'validation' do
    it { should validate_presence_of(:email) }
    # TODO: validate email uniqueness and inclusion fail
    # it { should validate_uniqueness_of(:email) }
    it { should validate_length_of(:email).is_at_least(5) }
    # it { should validate_inclusion_of(:email).in_array('%w(VALID_EMAIL_REGEX)') }
    it { should validate_presence_of(:password) }
  end

  describe 'association' do
    it { should have_many(:books) }
    it { should have_many(:orders) }
  end
end
