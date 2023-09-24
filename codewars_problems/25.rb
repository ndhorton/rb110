# Pete, the Baker

=begin
Notes:

Problem:
input: a hash, recipe, a hash, ingredients
output: an integer -> maximum number of cakes that can be baked

Write a method whose first paramter is a hash, recipe
  and whose second is a hash, ingredients (meaning ingredients available)
  and returns an integer representing how many cakes can be baked
  according to the recipe based on how many ingredients and quantities are available
  all of the values in the hashes are integer quantities

rules:
  must test for: does ingredients contain every key from recipe?
                 what is the minimum after dividing each ingredient value by each value in recipe?

Examples and test cases:

Data structures:

Algorithm:
Given a hash, recipe, and a hash, ingredients
If intersection of recipe keys and ingredients keys is NOT equal to recipe keys
  Return 0
Set ingredient_potentials := empty array
Iterate for each key in recipe, ingredient
  Set potential_cakes := ingredients[ingredient] / recipe[ingredient]
  Append potential_cakes to ingredient_potentials
Return minimum from ingredient_potentials 
=end

def cakes(recipe, ingredients)
  return 0 if recipe.keys.intersection(ingredients.keys) != recipe.keys
  ingredient_potentials = recipe.keys.map do |ingredient|
    ingredients[ingredient] / recipe[ingredient]
  end
  ingredient_potentials.min
end

p cakes({"flour"=>500, "sugar"=>200, "eggs"=>1},{"flour"=>1200, "sugar"=>1200, "eggs"=>5, "milk"=>200}) == 2
p cakes({"cream"=>200, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>1700, "flour"=>20000,
"milk"=>20000, "oil"=>30000, "cream"=>5000}) == 11
p cakes({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>500, "flour"=>2000,
"milk"=>2000}) == 0
p cakes({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>500, "flour"=>2000,
"milk"=>2000, "apples"=>15, "oil"=>20}) == 0
p cakes({"eggs"=>4, "flour"=>400},{}) == 0
p cakes({"cream"=>1, "flour"=>3, "sugar"=>1, "milk"=>1, "oil"=>1, "eggs"=>1},{"sugar"=>1, "eggs"=>1, "flour"=>3,
"cream"=>1, "oil"=>1, "milk"=>1}) == 1

# 15:30
