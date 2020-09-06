require 'rails_helper'

RSpec.describe LinkSubscription, type: :model do
  describe 'associations' do
    it { should belong_to(:recurrence_group) }
    it { should have_many(:recurrence_rules) }
  end
end
