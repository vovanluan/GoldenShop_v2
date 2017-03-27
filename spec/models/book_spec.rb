require 'rails_helper'

describe Book do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:in_stock) }
  it { should validate_presence_of(:image) }
  it { should validate_length_of(:title).is_at_least(3) }
  it { should validate_length_of(:title).is_at_most(100) }
  it { should validate_length_of(:description).is_at_least(10) }
  it { should validate_length_of(:description).is_at_most(800) }
  it { should validate_numericality_of(:price).is_greater_than(0) }
  it { should validate_numericality_of(:in_stock).only_integer }
  it { should belong_to(:user) }
  it { should have_many(:orders) }
  it { should have_many(:book_categories) }
  it { should have_many(:categories).through(:book_categories) }
end
