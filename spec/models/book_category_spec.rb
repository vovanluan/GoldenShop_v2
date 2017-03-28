require 'rails_helper'

describe BookCategory do
  it { should belong_to(:book) }
  it { should belong_to(:category) }
end
