require 'rails_helper'

RSpec.describe LinkSubscription, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:recurrence_group) }
  end
end
