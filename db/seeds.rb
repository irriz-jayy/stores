# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Creating users"
User.create(name:"Jay Felix", email:"jay@yahaa.com", shipping_address:"Eldoret",password:"1234")
User.create(name:"Bob Marley", email:"boby@yahaa.com", shipping_address:"Kitengela",password:"4321")
User.create(name:"Jane Doe", email:"jdoe@yahaa.com", shipping_address:"Kitale",password:"0000")
puts "Done creating users"

puts "Creating categories"
Category.create(name:"Dairy", description:"Any milk products.")
Category.create(name:"Fruits", description:"All fruits are available.")
Category.create(name:"Vegetables", description:"All vegetables are available")
Category.create(name:"Meat", description:"All your meat available. Rangng from beef, pork and poultry.")
puts "Done creating categories"

puts "Creating shipping methods"
ShippingMethod.create(name:"Standard", description:"Is sent by any delivery service.", cost:"200")
ShippingMethod.create(name:"Intermediate", description:"Is the fastest mean of delivery", cost:300)
ShippingMethod.create(name:"Basic", description:"Ordered goods are delivered end of day", cost:150)
puts "Done creating shipping methods"


puts "Creating produce"
Product.create(name:"Milk", price:65, image_url:"https://bit.ly/40rN8pf", category_id:1)
Product.create(name:"Red cabbage", price:30, image_url:"https://bit.ly/42UZCrm", category_id:3)
Product.create(name:"Lettuce", price:50, image_url:"https://bit.ly/3MclRmq", category_id:3)
Product.create(name:"Carrots", price:35, image_url:"https://bit.ly/40wRsnm", category_id:3)
Product.create(name:"Beef lean cuts", price:180, image_url:"https://bit.ly/3lO22Y9", category_id:4)
Product.create(name:"Skimmed milk", price:90, image_url:"https://bit.ly/40l6mwV", category_id:1)
Product.create(name:"Pineaples", price:40, image_url:"https://bit.ly/40ADGAk", category_id: 2 )
Product.create(name:"Avocados", price:40, image_url:"https://bit.ly/3Kkptl1", category_id:2)
Product.create(name:"Apples", price:35, image_url:"https://bit.ly/3M2Zujq", category_id:2)
Product.create(name:"Tomatoes", price:160, image_url:"https://bit.ly/3JVKlhm", category_id:3)
Product.create(name:"White onions", price:130, image_url:"https://bit.ly/40tsVzD", category_id:2)
Product.create(name:"Red onions", price:100, image_url:"https://bit.ly/3Zuy8pm", category_id:2)
Product.create(name:"Grapes", price:180, image_url:"https://bit.ly/3G01PIb", category_id:2)
Product.create(name:"Cucumber", price:40, image_url:"https://bit.ly/42Yk76s", category_id:2)
Product.create(name:"Mince meat", price:240, image_url:"https://bit.ly/3KrSgnS", category_id:4)
Product.create(name:"Chicken", price:140, image_url:"https://bit.ly/3zsDCGC", category_id:4)
Product.create(name:"Eggs", price:360, image_url:"https://bit.ly/40HfYT2", category_id:4)
Product.create(name:"Capsicum red", price:40, image_url:"https://bit.ly/432VqWD", category_id:3)
Product.create(name:"Spinach", price:40, image_url:"https://bit.ly/3Krw2SU", category_id:3)
Product.create(name:"Potato", price:200, image_url:"https://bit.ly/3zxeG0B", category_id:3)
Product.create(name:"Berries", price:40, image_url:"https://bit.ly/3U2RZuJ", category_id:2)
Product.create(name:"Cherries", price:160, image_url:"https://bit.ly/3Kun5bO", category_id:2)
Product.create(name:"Lemon", price:30, image_url:"https://bit.ly/40Tlr8L", category_id:3)
Product.create(name:"Ginger", price:40, image_url:"https://bit.ly/40MVCra", category_id:3)
Product.create(name:"Watermelon", price:100, image_url:"https://bit.ly/3Kp71b8", category_id:2)
Product.create(name:"Matoke banana", price:70, image_url:"https://bit.ly/3lWQMsy", category_id:3)
Product.create(name:"Pawpaq", price:50, image_url:"https://bit.ly/3JWg1mE", category_id:2)
Product.create(name:"Leeks", price:40, image_url:"https://bit.ly/40Snv0T", category_id:3)
Product.create(name:"Eggplant", price:40, image_url:"https://bit.ly/3zsPfh0", category_id:3)
Product.create(name:"Red chilli", price:25, image_url:"https://bit.ly/40MW1da", category_id:3)
Product.create(name:"Green chilli", price:25, image_url:"https://bit.ly/3U5vR2M", category_id:3)
Product.create(name:"Pears", price:50, image_url:"https://bit.ly/3ZB6h7b", category_id:2)
Product.create(name:"Mangoes", price:40, image_url:"https://bit.ly/3GcRKI1", category_id:2)
Product.create(name:"Dates", price:140, image_url:"https://bit.ly/3M5qAqe", category_id:2)
puts "Done creating produce"

puts "Creating orders"
Order.create(status:"To be delivered", total:300, shipping_method_id:1, user_id:1)
Order.create(status:"Shipping", total:700, shipping_method_id:2, user_id:2)
Order.create(status:"Delivered", total:550, shipping_method_id:3, user_id:3)
puts "Done creating orders"

puts "Creating order items"
OrderItem.create(quantity:2, price:50, order_id:1, product_id:3)
OrderItem.create(quantity:1, price:200, order_id:1, product_id:20)
OrderItem.create(quantity:1, price:200, order_id:1, product_id:20)
puts "Done creating order items"

