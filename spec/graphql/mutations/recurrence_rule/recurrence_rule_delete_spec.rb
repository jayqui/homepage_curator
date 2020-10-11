require 'rails_helper'

RSpec.describe Mutations::RecurrenceRule::RecurrenceRuleDelete do
  describe "#resolve" do
    let!(:recurrence_rule) { create(:recurrence_rule) }

    let(:mutation) do
      <<-GRAPHQL
        mutation recurrenceRuleDelete($recurrenceRuleId: ID!) {
          recurrenceRuleDelete(input: {
            recurrenceRuleId: $recurrenceRuleId,
          }) {
            recurrenceRule {
              id
              recurrenceGroupId
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
        }
      ).with_indifferent_access
    end

    it "does not err" do
      expect(subject[:errors]).to be_nil
    end

    it "updates the RecurrenceRule" do
      expect { subject }.to change { RecurrenceRule.count }.by(-1)
    end

    it "returns the appropriate data" do
      result = subject.dig(:data, :recurrenceRuleDelete, :recurrenceRule)
      expect(result[:id]).to eq(recurrence_rule.id.to_s)
    end
  end
end
