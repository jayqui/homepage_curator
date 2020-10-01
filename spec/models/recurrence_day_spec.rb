# == Schema Information
#
# Table name: recurrence_days
#
#  id                 :bigint           not null, primary key
#  recurrence_rule_id :bigint           not null
#  day_of_week_id     :bigint           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
require 'rails_helper'

RSpec.describe RecurrenceDay, type: :model do
  describe 'associations' do
    it { should belong_to(:recurrence_rule) }
    it { should belong_to(:day_of_week) }
  end
end
