# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  first_name :string
#  last_name  :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:recurrence_groups) }
    it { should have_many(:link_subscriptions) }
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
  end
end
