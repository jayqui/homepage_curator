require 'rails_helper'

RSpec.describe Mutations::LinkSubscription::LinkSubscriptionDelete do
  describe "#resolve" do
    let!(:link_subscription) { create(:link_subscription) }

    let(:mutation) do
      <<-GRAPHQL
        mutation linkSubscriptionDelete($linkSubscriptionId: ID!) {
          linkSubscriptionDelete(input: {
            linkSubscriptionId: $linkSubscriptionId,
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
          linkSubscriptionId: link_subscription.id,
        }
      ).with_indifferent_access
    end

    it "updates the LinkSubscription" do
      expect { subject }.to change { LinkSubscription.count }.by(-1)
    end

    it "returns the appropriate data" do
      result = subject.dig(:data, :linkSubscriptionDelete, :linkSubscription)
      expect(result[:id]).to eq(link_subscription.id.to_s)
    end
  end
end
