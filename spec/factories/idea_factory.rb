FactoryGirl.define do
  factory :idea do
    description "Yeah"
  end

  factory :empty_idea, class: Idea do
  end
end