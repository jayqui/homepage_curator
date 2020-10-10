require 'rails_helper'
RSpec.describe Mutations::LinkSubscription::LinkSubscriptionCreate do
  let(:recurrence_group) { create(:recurrence_group) }
  let(:url) { "http://some_url.org" }

  let(:mutation) do
    <<-GRAPHQL
      mutation linkSubscriptionCreate($recurrenceGroupId: ID!, $url: String!) {
        linkSubscriptionCreate(input: {
          recurrenceGroupId: $recurrenceGroupId,
          url: $url,
        }) {
          linkSubscription {
            id
            recurrenceGroupId
            url
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
        url: url,
      }
    ).with_indifferent_access
  end

  it "creates a new LinkSubscription" do
    expect { subject }.to change { LinkSubscription.count }.by(1)
  end

  it "the LinkSubscription has the correct attributes" do
    subject
    expect(LinkSubscription.last.url).to eq(url)
  end
end
