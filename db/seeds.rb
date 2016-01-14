(1..10).each do |index|
  User.create(name: Faker::Name.first_name, email: Faker::Internet.email, password: '12345678', password_confirmation:'12345678')
end

(1..20).each do |index|
  Pet.create(name: Faker::Name.first_name, species: Faker::Lorem.word, age: Faker::Number.number(1), user_id: rand(10))
end