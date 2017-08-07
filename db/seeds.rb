user_data = [
  {username:"Forefront", email:"f@f.com", password: "password"},
  {username:"Logan", email:"logandsprice@gmail.com", password: "password"},
  {username:"Pavan", email:"pavan.sarguru@gmail.com", password: "password"},
  {username:"Arjun", email:"avenkat2@gmail.com", password: "password"}
]
user_data.each { |u| Refinery::Authentication::Devise::User.new(u).create_first }

# Added by Refinery CMS Pages extension
Refinery::Pages::Engine.load_seed
p "Pages seeded"

# Added by Refinery CMS Projects extension
Refinery::Projects::Engine.load_seed
p "Projects seeded"

# Added by Refinery CMS Articles extension
Refinery::Articles::Engine.load_seed
p "Articles seeded"

# Added by Refinery CMS TeamMembers extension
Refinery::TeamMembers::Engine.load_seed
p "TeamMembers seeded"

# Added by Refinery CMS Tags extension
Refinery::Tags::Engine.load_seed
p "Tags seeded"

# Added by Refinery CMS OrganizationTabs extension
Refinery::OrganizationTabs::Engine.load_seed
p "OrganizationTabs seeded"

# Added by Refinery CMS CustomPages extension
Refinery::CustomPages::Engine.load_seed
p "CustomPages seeded"
