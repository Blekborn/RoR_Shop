# json.array!(@product) do |prod|
#   json.name prod.title
# end
#
json.products do
  json.array!(@products) do |product|
    json.title product.title
    json.url product_path(product)
  end
end

# json.categories do
#   json.array!(@categories) do |category|
#     json.name category.name
#     json.url category_path(category)
#   end
# end