require 'rails_helper'

describe ProfilePolicy do
  subject { described_class }

  context "for a visitor" do
    let(:member) {nil}
    let(:profile) {FactoryGirl.create(:profile)}


    permissions :index?, :show?, :new?, :create?, :edit?, :update?, :destroy? do
      it "denies access to non logged-in visitors" do
        expect(subject).not_to permit(member, profile)
      end
    end
  end

  context "for a member viewing other members' profiles or creating a profile of their own" do
    let(:member) {FactoryGirl.create(:member)}
    let(:profile) {FactoryGirl.create(:profile)}


    permissions :index?, :show?, :new?, :create? do
      it "grants access to logged-in members" do
        expect(subject).to permit(member, profile)
      end
    end

    permissions :edit?, :update?, :destroy?do
      it "denies access to logged-in members for whom the profile does not belong" do
        expect(subject).not_to permit(member, profile)
      end
    end
  end

  context "for a member editing their own profile" do
    let(:member) {FactoryGirl.create(:member)}

    permissions :edit?, :update?, :destroy? do
      it "grants access to logged-in members if profile belongs to member" do
        expect(subject).to permit(member, Profile.create!(
        member_id: member.id,
        first_name: "Jane",
        last_name: "Doe",
        smoker: false,
        pet_owner: false)
        )
      end
    end
  end

end
