# frozen_string_literal: true

require "spec_helper"

describe Decidim::ActionDelegator::Admin::DelegationForm do
  subject { described_class.from_params(attributes) }

  let(:organization) { create(:organization) }
  let(:granter) { create(:user, organization: organization) }
  let(:grantee) { create(:user, organization: organization) }

  context "when there's granter and grantee" do
    let(:attributes) { { granter_id: granter.id, grantee_id: grantee.id } }

    it { is_expected.to be_valid }
  end

  context "when granter is missing" do
    let(:attributes) { { granter_id: nil, grantee_id: grantee.id } }

    it { is_expected.not_to be_valid }
  end

  context "when grantee is missing" do
    let(:attributes) { { granter_id: granter.id, grantee_id: nil } }

    it { is_expected.not_to be_valid }
  end
end
