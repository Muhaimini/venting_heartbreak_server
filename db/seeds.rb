# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#

if Api::V1::Role.count.zero?
  Api::V1::Role.create([
    { value: "admin" },
    { value: "user" },
    { value: "user_guest" }
  ])
  puts "Roles created."
else
  puts "Skipping roles creation."
end

if Api::V1::User.count.zero?
  admin_role = Api::V1::Role.find_by(value: "admin")
  user_role = Api::V1::Role.find_by(value: "user")
  if admin_role && user_role
    Api::V1::User.create([
      {
        username: "admin",
        password: "admin",
        email: "admin@gmail.com",
        initial_name: "A",
        label_color: "#ffff",
        role_id: admin_role.id
      },
      {
        username: "user",
        password: "user1234",
        email: "user@gmail.com",
        initial_name: "U",
        label_color: "#ffff",
        role_id: user_role.id
      }
    ])
    puts "Users created."
  end
else
  puts "Skipping users creation."
end

if Api::V1::ThemeType.count.zero?
  Api::V1::ThemeType.create([
    {
      title: "birthday",
      description: "Undagan ulang tahun",
      img_cover: "https://images.unsplash.com/photo-1729438873852-47c24a018407?q=80&w=2938"
    },
    {
      title: "wedding",
      description: "Undangan pernikahan",
      img_cover: "https://images.unsplash.com/photo-1727872303742-3c7d9088c67c?q=80&w=2788"
    }
  ])
else
  puts "Skipping theme types creation."
end

if Api::V1::ThemeLayout.count.zero?
  Api::V1::ThemeLayout.create([
    { name: "wedding default", },
    { name: "birthday default" },
    { name: "flip book 1" },
  ])
else
  puts "Skipping layout types creation."
end

if Api::V1::InvitationTheme.count.zero?
  admin_role = Api::V1::Role.find_by(value: "admin")
  wedding_theme_type = Api::V1::ThemeType.find_by(title: "wedding")
  flip_book_1_layout = Api::V1::ThemeLayout.find_by(name: "flip book 1")

  if admin_role && wedding_theme_type && flip_book_1_layout
    Api::V1::InvitationTheme.create([
      {
        creator_id: admin_role.id,
        type_theme_id: wedding_theme_type.id,
        theme_layout_id: flip_book_1_layout.id,
        label: "Me and you",
        description: "Someday",
        img_cover: "https://images.unsplash.com/photo-1729459361651-bf88dc8cb9ba?q=80&w=2940",
        song_src: "https://dl.sndup.net/sjsrb/Fourtwnty%20-%20Sebelah%20Mata.mp3",
        started_at: "2025-01-01",
        ended_at: "2025-01-01"
      }
    ])
  end
else
  puts "Skipping invitation themes creation."
end
