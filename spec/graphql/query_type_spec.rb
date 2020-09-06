require 'rails_helper'

RSpec.describe Types::QueryType do
  describe "#random_url_for_current_time" do
    let(:day_of_week) { Time.zone.now.strftime("%A").downcase }
    let(:start_time) { 1.hour.ago }
    let(:end_time) { 1.hour.from_now }

    let(:recurrence_rule) do
      create(:recurrence_rule, day_of_week: day_of_week, start_time: start_time, end_time: end_time)
    end
    let(:recurrence_group) { create(:recurrence_group, recurrence_rules: [recurrence_rule]) }
    let!(:link_subscription) { create(:link_subscription, recurrence_group: recurrence_group) }
    let(:user) { recurrence_group.user }

    let(:query) do
      <<-GRAPHQL
        {
          randomUrlForCurrentTime(userId: #{user.id}) {
            randomUrlForCurrentTime
          }
        }
      GRAPHQL
    end

    subject do
      HomepageCuratorSchema.execute(query).with_indifferent_access
    end

    it "returns one of the randomly selected links" do
      result = subject.dig(:data, :randomUrlForCurrentTime, :randomUrlForCurrentTime)
      expect(result).to eq(link_subscription.url)
    end

    context "when there are no link subscriptions for the current user at the current time" do
      let(:link_subscription) { nil }

      it "returns a null result" do
        result = subject.dig(:data, :randomUrlForCurrentTime, :randomUrlForCurrentTime)
        expect(result).to be_nil
      end
    end
  end
end
