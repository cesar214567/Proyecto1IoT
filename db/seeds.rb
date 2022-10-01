# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'open-uri'
require 'csv'

data = {
  'cebolla' => "https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Two_colors_of_onions.jpg/800px-Two_colors_of_onions.jpg",
  'zanahoria' => 'https://www.recetasnestlecam.com/sites/default/files/2022-04/que-es-la-zanahoria.jpg',
  'tomate' => 'https://www.quironsalud.es/idcsalud-client/cm/images?locale=es_ES&idMmedia=2299323',
  'carne' => 'https://limacarnes.com/wp-content/uploads/2020/06/BIFE_72_2400v2.jpg',
  'pollo' => 'https://img.freepik.com/fotos-premium/pollo-crudo-sobre-tabla-madera-aislada_176402-6723.jpg?w=2000',
  'papa' => 'https://saborusa.com.pa/imagesmg/imagenes/5ff3e6a0b703f_potatoes-food-supermarket-agriculture-JG7QGNY.jpg'
}

data.each do |key, value|
  ingredient = Ingredient.create!(name: key)
  ingredient_image = URI.open(value)
  ingredient.image.attach!({ io: ingredient_image, filename: "image#{key}", content_type: 'image/png' })
end
