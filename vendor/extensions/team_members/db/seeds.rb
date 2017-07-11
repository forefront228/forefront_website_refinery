Refinery::I18n.frontend_locales.each do |lang|
  I18n.locale = lang

  Refinery::User.find_each do |user|
    user.plugins.where(name: 'refinerycms-team_members').first_or_create!(
      position: (user.plugins.maximum(:position) || -1) +1
    )
  end if defined?(Refinery::User)

  Refinery::Page.where(link_url: (url = "/team_members")).first_or_create!(
    title: 'Team Members',
    deletable: false,
    menu_match: "^#{url}(\/|\/.+?|)$"
  ) do |page|
    Refinery::Pages.default_parts.each_with_index do |part, index|
      page.parts.build title: part[:title], slug: part[:slug], body: nil, position: index
    end
  end if defined?(Refinery::Page)
end

require 'faker'

Refinery::TeamMembers::TeamMember.destroy_all

#creating refinery image primary_image and secondary_image filler
Refinery::Image.create(image:File.new('app/assets/images/team1.png'))
Refinery::Image.create(image:File.new('app/assets/images/bg-1.jpg'))

a = Refinery::Image.create(image: File.new('app/assets/images/team-arjun.jpeg'))
aa = Refinery::Image.create(image: File.new('app/assets/images/team-arjun2.jpeg'))
l = Refinery::Image.create(image: File.new('app/assets/images/team-logan.jpg'))
ll = Refinery::Image.create(image: File.new('app/assets/images/team-logan2.jpeg'))
pav = Refinery::Image.create(image: File.new('app/assets/images/team-pavan.jpeg'))
pavpav = Refinery::Image.create(image: File.new('app/assets/images/team-pavan2.jpg'))

def generate_bio
  paragraphs=[]
  sentences = []
    rand(2..4).times {
      rand(4..8).times do
        sentences << Faker::Lorem.sentence(9,true,9)
      end
      paragraphs << sentences.join("")
      sentences=[]
    }
  paragraphs.map { |p| "<p>" + p + "</p>"}.join("")
end

team_members = [
  {
    first_name: "Logan",
    last_name: "Price",
    role: "Developer",
    bio:generate_bio,
    primary_image: l,
    secondary_image: ll
  },
  {
    first_name:"Pavan",
    last_name:"Sarguru",
    role:"Developer",
    bio:generate_bio,
    primary_image: pav,
    secondary_image: pavpav
  },
  {
    first_name:"Arjun",
    last_name:"Venkataswamy",
    role:"Senior Developer",
    bio:generate_bio,
    primary_image: a,
    secondary_image: aa
  }
]

team_members.each { |t| Refinery::TeamMembers::TeamMember.create(t)}
