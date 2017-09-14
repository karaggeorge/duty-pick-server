require 'rails_helper'

RSpec.describe Member, type: :model do
  it { should belong_to(:room) }
  it { should validate_presence_of(:name) }
end
