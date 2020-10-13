require 'rails_helper'

RSpec.describe Mutations::RecurrenceGroup::RecurrenceGroupUpdate do
  describe "#resolve" do
    let(:recurrence_group) { create(:recurrence_group) }
    let(:new_name) { "New Recurrence Group Name" }

    let(:mutation) do
      <<-GRAPHQL
        mutation recurrenceGroupUpdate($recurrenceGroupId: ID!, $name: String!) {
          recurrenceGroupUpdate(input: {
            recurrenceGroupId: $recurrenceGroupId,
            name: $name,
          }) {
            recurrenceGroup {
              id
              name
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
          name: new_name,
        }
      ).with_indifferent_access
    end

    it "updates the RecurrenceGroup" do
      expect { subject }.to change { recurrence_group.reload.name }.
        from(anything).to(new_name)
    end

    it "returns the appropriate data" do
      result = subject.dig(:data, :recurrenceGroupUpdate, :recurrenceGroup)
      expect(result[:name]).to eq(new_name)
    end
  end
end
