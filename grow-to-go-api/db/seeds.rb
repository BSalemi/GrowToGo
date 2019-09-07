# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Plant.destroy_all

zz_plant = Plant.create(name: "ZZ Plant", species: "Zamioculcas Zamiifolia", price: 110, exp_level: "Beginner", size: "Large", light_required: "Low to Bright Indirect", image: "https://bloomscape.com/wp-content/uploads/2019/03/bloomscape_product-zz-plant-slate-1-324x393.jpg")

burgundy_rubber = Plant.create(name: "Burgundy Rubber Tree", species: "Ficus Elastica 'Burgundy'", price: 110, exp_level: "Intermediate", size: "Large", light_required: "Low to Bright Indirect", image: "https://bloomscape.com/wp-content/uploads/2019/03/bloomscape_product-burgundy-rubber-tree-charcoal-2-324x393.jpg")

wandering_jew = Plant.create(name: "Wandering Jew", species: "Tradescantia Zebrina", price: 35, exp_level: "Beginner", size: "Small", light_required: "Bright Indirect", image: "https://bloomscape.com/wp-content/uploads/2019/04/bloomscape_product-wandering-jew-slate-324x393.jpg")

fiddle_leaf = Plant.create(name: "Fiddle Leaf Fig", species: "Ficus lyrata", price: 155, exp_level: "Advanced", size: "X-Large", light_required: "Bright Indirect", image: "https://bloomscape.com/wp-content/uploads/2019/05/bloomscape_product-fiddle-leaf-fig-slate-2-e1558203121213-324x394.jpg")

kimberly_queen = Plant.create(name: "Kimberly Queen Fern", species: "Nephrolepis Obliterata", price: 65, exp_level: "Intermediate", size: "Medium", light_required: "Medium to Bright Indirect", image: "https://bloomscape.com/wp-content/uploads/2019/05/bloomscape_product-kimberly-queen-fern-slate-2-324x393.jpg")

neon_pothos = Plant.create(name: "Neon Pothos", species: "Epipremnum Aureum", price: 20, exp_level: "Beginner", size: "Mini", light_required: "Low to Medium Indirect", image: "//cdn.shopify.com/s/files/1/0150/6262/products/the-sill_neon-pothos_grant_blush_5_1500x.progressive.jpg?v=1566928489")

snake_plant = Plant.create(name: "Petite Snake Plant", species: "Sansevieria", price: 25, exp_level: "Beginner", size: "Mini", light_required: "Medium Indirect", image: "//cdn.shopify.com/s/files/1/0150/6262/products/the-sill_potted-plant_cylindrical-snake-plant_ezra_mint_1500x.progressive.jpg?v=1560530525")

silver = Plant.create(name: "Silver Philodendron", species: "Scindapsus Pictus", price: 25, exp_level: "Beginner", size: "Mini", light_required: "Medium Indirect", image: "//cdn.shopify.com/s/files/1/0150/6262/products/the-sill_potted-plant_silver-philodendron_hyde_mustard-4_1500x.progressive.jpg?v=1566328793")

majesty = Plant.create(name: "Majesty Palm", species: "Ravenea Rivularis", price: 150, exp_level: "Intermediate", size: "X-Large", light_required: "Low to Bright Indirect", image: "https://bloomscape.com/wp-content/uploads/2019/03/bloomscape_product-majesty-palm-stone-324x393.jpg")

bird_paradise = Plant.create(name: "Bird of Paradise", species: "Strelitzia Nicolai", price: 150, exp_level: "Intermediate", size: "X-Large", light_required: "Bright Indirect to Bright Direct", image: "https://bloomscape.com/wp-content/uploads/2019/04/bloomscape_product-bird-of-paradise-stone-324x393.jpg")

monstera = Plant.create(name: "Monstera", species: "Monstera Deliciosa", price: 60, exp_level: "Beginner", size: "Medium", light_required: "Bright Indirect", image: "//cdn.shopify.com/s/files/1/0150/6262/products/the-sill_potted-plant_monstera-6_hyde_mint_7_1500x.progressive.jpg?v=1564151052")

alocasia_polly = Plant.create(name: "Alocasia Polly", species: "Alocasia 'Polly'", price: 40, exp_level: "Advanced", size: "Small", light_required: "Medium Indirect", image: "/cdn.shopify.com/s/files/1/0150/6262/products/the-sill_alocasia-polly_august_blush_4_1500x.progressive.jpg?v=1566848403")

dracaena = Plant.create(name: "Dracaena Colorama", species: "Dracaena Marginata 'Colorama'", price: 110, exp_level: "Intermediate", size: "Large", light_required: "Bright Indirect", image: "https://bloomscape.com/wp-content/uploads/2019/03/bloomscape_product-dracaena-colorama-charcoal-1-324x393.jpg")

aloe = Plant.create(name: "Hedgehog Aloe", species: "Aloe Humilis 'Hedgehog'", price: 35, exp_level: "Beginner", size: "Small", light_required: "Bright Indirect to Full Sun", image: "https://bloomscape.com/wp-content/uploads/2019/04/bloomscape_product-hedgehog-aloe-clay-324x393.jpg")

bird_nest = Plant.create(name: "Bird's Nest Fern", species: "Asplenium Nidus", price: 35, exp_level: "Intermediate", size: "Small", light_required: "Low to Bright Indirect", image: "https://bloomscape.com/wp-content/uploads/2019/04/bloomscape-product-birds-nest-fern-stone-324x393.jpg")

ponytail = Plant.create(name: "Ponytail Palm", species: "Beaucarnea Recurvata", price: 65, exp_level: "Beginner", size: "Medium", light_required: "Bright Indirect to Bright Direct", image: "https://bloomscape.com/wp-content/uploads/2019/03/bloomscape_product-ponytail-palm-slate-324x393.jpg")

peperomia = Plant.create(name: "Peperomia Ginny", species: "Peperomia Clusiifolia 'Ginny'", price: 35, exp_level: "Beginner", size: "Small", light_required: "Low to Bright Indirect", image: "https://bloomscape.com/wp-content/uploads/2019/03/bloomscape-product-peperomia-ginny-charcoal-324x393.jpg")