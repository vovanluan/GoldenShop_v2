require 'rails_helper'

describe Category do
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_length_of(:name).is_at_least(2) }
  it { should validate_length_of(:name).is_at_most(30) }
  it { should validate_presence_of(:description) }
  it { should validate_length_of(:description).is_at_least(20) }
  it { should validate_length_of(:description).is_at_most(500) }
  it { should have_many(:book_categories) }
  it { should have_many(:books).through(:book_categories) }
end
