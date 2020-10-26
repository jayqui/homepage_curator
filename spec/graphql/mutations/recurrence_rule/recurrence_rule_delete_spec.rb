require 'rails_helper'

RSpec.describe Mutations::RecurrenceGroup::RecurrenceGroupDelete do
  describe "#resolve" do
    let!(:recurrence_group) { create(:recurrence_group) }

    let(:mutation) do
      <<-GRAPHQL
        mutation recurrenceGroupDelete($recurrenceGroupId: ID!) {
          recurrenceGroupDelete(input: {
            recurrenceGroupId: $recurrenceGroupId,
          }) {
            recurrenceGroup {
              id
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
          recurrenceGroupId: recurrence_group.id,
        }
      ).with_indifferent_access
    end

    it "does not err" do
      expect(subject[:errors]).to be_nil
    end

    it "updates the RecurrenceGroup" do
      expect { subject }.to change { RecurrenceGroup.count }.by(-1)
    end

    it "returns the appropriate data" do
      result = subject.dig(:data, :recurrenceGroupDelete, :recurrenceGroup)
      expect(result[:id]).to eq(recurrence_group.id.to_s)
    end
  end
end
