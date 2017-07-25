Refinery::I18n.frontend_locales.each do |lang|
  I18n.locale = lang

  Refinery::User.find_each do |user|
    user.plugins.where(name: 'refinerycms-custom_pages').first_or_create!(
      position: (user.plugins.maximum(:position) || -1) +1
    )
  end if defined?(Refinery::User)

  Refinery::Page.where(link_url: (url = "/custom_pages")).first_or_create!(
    title: 'Custom Pages',
    deletable: false,
    menu_match: "^#{url}(\/|\/.+?|)$"
  ) do |page|
    Refinery::Pages.default_parts.each_with_index do |part, index|
      page.parts.build title: part[:title], slug: part[:slug], body: nil, position: index
    end
  end if defined?(Refinery::Page)
end

Refinery::CustomPages::CustomPage.destroy_all

pages = [
  {
    name: "Contact",
    phone_number: "3123761140",
    address_line_1: "Forefront Structural Engineers",
    address_line_2: "228 S Wabash Ave #300",
    city_state_zip: "Chicago, IL 60604",
    email_address: "info@forefrontstructural.com",
    map_embed: '<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2970.659735433162!2d-87.6285748849054!3d41.87866677335837!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x880e2ca3085e35a3%3A0xff354344f728f4fc!2sForefront+Structural+Engineer+Inc!5e0!3m2!1sen!2sus!4v1493580701752" frameborder="0" style="width: 100%; height: 400px;"></iframe>'
  },

  {
    name: "Team",
    hero_image: Refinery::Image.create(image: File.new('app/assets/images/team-hero.jpg')),
    body: "<p>
      But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.
    </p>
    <p>
      But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.
    </p>",
    body_header: "Where ideas are born",
    hero_banner_text: "Our Team"
  },

  {
    name: "News",
    hero_image: Refinery::Image.create(image: File.new('app/assets/images/news-hero.jpg')),
    hero_banner_text: "News"
  }
]

pages.each do |page|
  Refinery::CustomPages::CustomPage.create(page)
end
