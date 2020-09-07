# == Schema Information
#
# Table name: recurrence_groups
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe RecurrenceGroup, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:recurrence_rules) }
    it { should have_many(:link_subscriptions) }
  end
end
