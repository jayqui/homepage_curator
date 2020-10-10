require 'rails_helper'

RSpec.describe Mutations::LinkSubscription::LinkSubscriptionUpdate do
  describe "#resolve" do
    let(:link_subscription) { create(:link_subscription) }
    let(:link_subscription_id) { link_subscription.id }
    let(:url) { "http://new_url.org" }

    let(:mutation) do
      <<-GRAPHQL
        mutation linkSubscriptionUpdate($linkSubscriptionId: ID!, $url: String!) {
          linkSubscriptionUpdate(input: {
            linkSubscriptionId: $linkSubscriptionId,
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
          linkSubscriptionId: link_subscription_id,
          url: url,
        }
      ).with_indifferent_access
    end

    it "updates the LinkSubscription" do
      expect { subject }.to change { link_subscription.reload.url }.
        from("http://example.com").to(url)
    end

    it "returns the appropriate data" do
      result = subject.dig(:data, :linkSubscriptionUpdate, :linkSubscription)
      expect(result[:url]).to eq(url)
    end
  end
end
