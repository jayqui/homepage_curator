# == Schema Information
#
# Table name: recurrence_rules
#
#  id                  :bigint           not null, primary key
#  recurrence_group_id :bigint           not null
#  start_time          :time
#  end_time            :time
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  begin_day           :string
#  end_day             :string
#  all_derived_days    :string           default([]), is an Array
#
require 'rails_helper'

RSpec.describe RecurrenceRule, type: :model do
  describe 'associations' do
    it { should belong_to(:recurrence_group) }
  end

  describe 'validations' do
    it { should validate_presence_of(:start_time) }
    it { should validate_presence_of(:end_time) }
    it { should validate_inclusion_of(:begin_day).in_array(RecurrenceRule::ALL_DAYS) }
    it { should validate_inclusion_of(:end_day).in_array(RecurrenceRule::ALL_DAYS) }
  end

  describe 'derived days' do
    let!(:recurrence_rule) do
      create(
        :recurrence_rule,
        begin_day: :saturday,
        end_day: :tuesday,
      )
    end

    it "saves the approprate derived days" do
      expect(recurrence_rule.all_derived_days).to contain_exactly("saturday", "sunday", "monday", "tuesday")
    end
  end
end
