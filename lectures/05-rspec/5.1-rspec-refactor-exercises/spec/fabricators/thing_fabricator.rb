Fabricator(:thing) do
  name { Fabricate.sequence(:name) { |i| "Thing Number #{i}" } }
  description { Faker::Lorem.paragraph }
end
