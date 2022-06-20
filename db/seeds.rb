10.times do 
    Recipe.create(name: Faker::Food.dish, 
    ingredients: Faker::Food.ingredient,
    instructions: Faker::Food.description,
    minutes: rand(1..60), 
    difficulty: rand(1..5))
end