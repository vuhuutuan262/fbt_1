User.create name: "admin",is_admin: true, email: "admin@admin.com",
  password: "password"

User.create name: "normal", email: "normal@email.com", password: "password"

40.times do |n|
  name = "user#{n}"
  email = "user#{n}@email.com"
  password = "password"
  User.create name: name, email: email, password: password
end

Place.create name: "Ha Noi", image: "hanoi.jpg"
Place.create name: "Da Nang", image: "danang.jpg"
Place.create name: "Co To", image: "coto.jpg"
Place.create name: "Sa Pa", image: "sapa.jpg"
Place.create name: "Moc Chau", image: "mocchau.jpg"
Place.create name: "Ly Son", image: "lyson.jpg"
Place.create name: "Ha Long", image: "halong.jpg"
Place.create name: "Ba Vi", image: "bavi.jpg"
Place.create name: "Hue", image: "hue.jpg"
Place.create name: "Nha Trang", image: "nhatrang.jpg"
