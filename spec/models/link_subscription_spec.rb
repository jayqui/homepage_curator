# == Schema Information
#
# Table name: link_subscriptions
#
#  id                  :bigint           not null, primary key
#  recurrence_group_id :bigint           not null
#  url                 :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
require 'rails_helper'

RSpec.describe LinkSubscription, type: :model do
  describe 'associations' do
    it { should belong_to(:recurrence_group) }
    it { should have_many(:recurrence_rules) }
  end

  describe 'validations' do
    it { should validate_presence_of(:url) }
  end
end
