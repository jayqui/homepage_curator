require 'rails_helper'

RSpec.describe RecurrenceGroup, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:recurrence_rules) }
    it { should have_many(:link_subscriptions) }
  end
end
