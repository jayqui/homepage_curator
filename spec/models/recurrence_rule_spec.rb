require 'rails_helper'

RSpec.describe RecurrenceRule, type: :model do
  describe 'associations' do
    it { should belong_to(:recurrence_group) }
  end
end
