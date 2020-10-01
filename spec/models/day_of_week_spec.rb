# == Schema Information
#
# Table name: day_of_weeks
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe DayOfWeek, type: :model do
  describe 'associations' do
    it { should have_many(:recurrence_days) }
  end
end
