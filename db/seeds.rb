# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

%w(Residential Institutional Mixed-Use Hospitality Commercial).each do |c|
  Category.create(name:c)
end
# Added by Refinery CMS Pages extension
Refinery::Pages::Engine.load_seed

# Added by Refinery CMS Projects extension
Refinery::Projects::Engine.load_seed

# Added by Refinery CMS Articles extension
Refinery::Articles::Engine.load_seed

# Added by Refinery CMS TeamMembers extension
Refinery::TeamMembers::Engine.load_seed

# Added by Refinery CMS Tags extension
Refinery::Tags::Engine.load_seed
