require 'rails_helper'

RSpec.describe Mutations::RecurrenceRule::RecurrenceRuleUpdate do
  describe "#resolve" do
    let(:recurrence_rule) { create(:recurrence_rule) }
    let(:new_end_day) { "tuesday" }

    let(:mutation) do
      <<-GRAPHQL
        mutation recurrenceRuleUpdate($recurrenceRuleId: ID!, $attributes: RecurrenceRuleAttributes!) {
          recurrenceRuleUpdate(input: {
            recurrenceRuleId: $recurrenceRuleId,
            attributes: $attributes,
          }) {
            recurrenceRule {
              id
              recurrenceGroupId
              beginDay
              endDay
              allDerivedDays
              startTime
              endTime
            }
            errors
          }
        }
      GRAPHQL
    end

    subject do
      HomepageCuratorSchema.execute(
        mutation,
        variables: {
          recurrenceRuleId: recurrence_rule.id,
          attributes: {
            endDay: new_end_day,
          }
        }
      ).with_indifferent_access
    end

    it "updates the RecurrenceRule" do
      expect { subject }.to change { recurrence_rule.reload.end_day }.
        from("monday").to(new_end_day)
    end

    it "returns the appropriate data" do
      result = subject.dig(:data, :recurrenceRuleUpdate, :recurrenceRule)
      expect(result[:endDay]).to eq(new_end_day)
      expect(result[:allDerivedDays]).to include(new_end_day)
    end
  end
end
