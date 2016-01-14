FactoryGirl.define do

  factory :pet do |f|
    f.name {Faker::Name.first_name}
    f.species {Faker::Lorem.word}
    f.age {Faker::Number.number(1)}
  end
  
end

