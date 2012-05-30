Fabricator(:role) do
  name { Faker::Company.position }
  department { 'Widgets' }
end
