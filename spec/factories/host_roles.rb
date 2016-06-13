FactoryGirl.define do
  factory :host_role do
    guest_smoking_preference "no smokers allowed"
    guest_pet_preference "no furry-pet owners allowed"
    member nil
  end
end
