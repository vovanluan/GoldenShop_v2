require 'rails_helper'

describe Order do
  it { should validate_presence_of(:quantity) }
  it { should validate_numericality_of(:quantity).only_integer }
  it { should validate_numericality_of(:quantity).is_greater_than(0) }
  it { should validate_presence_of(:status) }
  it { should validate_numericality_of(:status).only_integer }
  it { should validate_inclusion_of(:status).in_range(1..6) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:book_id) }
end
