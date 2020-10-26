require 'rails_helper'
RSpec.describe Mutations::RecurrenceGroup::RecurrenceGroupCreate do
  let(:user) { create(:user) }
  let(:name) { "My Special Name" }

  let(:mutation) do
    <<-GRAPHQL
      mutation recurrenceGroupCreate($userId: ID!, $name: String!) {
        recurrenceGroupCreate(input: {
          userId: $userId,
          name: $name,
        }) {
          recurrenceGroup {
            id
            name
            recurrenceRules {
              id
            }
            linkSubscriptions {
              id
            }
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
        userId: user.id,
        name: name,
      }
    ).with_indifferent_access
  end

  it "does not err" do
    expect(subject[:errors]).to be_nil
  end

  it "creates a new RecurrenceGroup" do
    expect { subject }.to change { RecurrenceGroup.count }.by(1)
  end

  it "the RecurrenceGroup has the correct attributes" do
    result = subject.dig(:data, :recurrenceGroupCreate, :recurrenceGroup)
    expect(result[:name]).to eq(name)
  end
end
