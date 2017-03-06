# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u=User.new
u.email= "xyy321@gmail.com"
u.password= "xyy321"
u.password_confirmation="xyy321"
u.is_admin=true
u.save



Product.create!(title:"菠萝",quantity:100,price:5,kind:"fruit",
owner:"shop1",place:"中国",image: open("https://ww2.sinaimg.cn/large/006tNc79gy1fdc0jy9l3dj30el09qt99.jpg"))

Product.create!(title:"猕猴桃",quantity:100,price:5,kind:"fruit",
owner:"shop1",place:"中国",image: open("https://ww3.sinaimg.cn/large/006tNc79gy1fdc0tkigwfj30el09qdft.jpg"))

#Product.create!(title:"冰葡萄",quantity:100,price:5,kind:"fruit",
#owner:"shop1",place:"中国海南",image: open("https://ww2.sinaimg.cn/large/006tNc79gy1fdc0uhdxzij30em09qaae.jpg"))

Product.create!(title:"水果沙拉",quantity:100,price:10,kind:"salad",
owner:"shop1",place:"中国",image: open("https://ww3.sinaimg.cn/large/006tNc79gy1fdc0vrd3pqj30em09qjrq.jpg"))

Product.create!(title:"家庭聚会包",quantity:100,price:20,kind:"set",
owner:"shop1",place:"中国",image: open("https://ww1.sinaimg.cn/large/006tNc79gy1fdc14dqrhfj307o053glo.jpg"))
