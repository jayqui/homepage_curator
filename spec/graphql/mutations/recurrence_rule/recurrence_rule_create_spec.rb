require 'rails_helper'
RSpec.describe Mutations::RecurrenceRule::RecurrenceRuleCreate do
  let(:recurrence_group) { create(:recurrence_group) }
  let(:begin_day) { "monday" }
  let(:end_day) { "wednesday" }
  let(:start_time) { "09:00:00" }
  let(:end_time) { "17:00:00" }


  let(:mutation) do
    <<-GRAPHQL
      mutation recurrenceRuleCreate($recurrenceGroupId: ID!, $attributes: RecurrenceRuleAttributes!) {
        recurrenceRuleCreate(input: {
          recurrenceGroupId: $recurrenceGroupId,
          attributes: $attributes,
        }) {
          recurrenceRule {
            id
            recurrenceGroupId
            beginDay
            endDay
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
        recurrenceGroupId: recurrence_group.id,
        attributes: {
          beginDay: begin_day,
          endDay: end_day,
          startTime: start_time,
          endTime: end_time,
        }
      }
    ).with_indifferent_access
  end

  it "creates a new RecurrenceRule" do
    expect { subject }.to change { RecurrenceRule.count }.by(1)
  end

  it "the RecurrenceRule has the correct attributes" do
    result = subject.dig(:data, :recurrenceRuleCreate, :recurrenceRule)
    expect(result[:beginDay]).to eq(begin_day)
    expect(result[:endDay]).to eq(end_day)
    expect(result[:startTime]).to eq(start_time)
    expect(result[:endTime]).to eq(end_time)
  end
end
