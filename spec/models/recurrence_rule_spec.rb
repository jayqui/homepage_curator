# == Schema Information
#
# Table name: recurrence_rules
#
#  id                  :bigint           not null, primary key
#  recurrence_group_id :bigint           not null
#  day_of_week         :string
#  start_time          :time
#  end_time            :time
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
require 'rails_helper'

RSpec.describe RecurrenceRule, type: :model do
  describe 'associations' do
    it { should belong_to(:recurrence_group) }
  end
end
