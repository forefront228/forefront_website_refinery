Refinery::I18n.frontend_locales.each do |lang|
  I18n.locale = lang

  Refinery::User.find_each do |user|
    user.plugins.where(name: 'refinerycms-tags').first_or_create!(
      position: (user.plugins.maximum(:position) || -1) +1
    )
  end if defined?(Refinery::User)

  Refinery::Page.where(link_url: (url = "/tags")).first_or_create!(
    title: 'Tags',
    deletable: false,
    menu_match: "^#{url}(\/|\/.+?|)$"
  ) do |page|
    Refinery::Pages.default_parts.each_with_index do |part, index|
      page.parts.build title: part[:title], slug: part[:slug], body: nil, position: index
    end
  end if defined?(Refinery::Page)
end

require 'faker'
tags = ["Residential", "Commercial", "Hospitality", "Institutional", "Community", "Mixed-Use", "Adaptive", "New Construction"]

tags.each do |tag|
  Refinery::Tags::Tag.create(name:tag)
end

Refinery::Projects::Project.all.each { |project| project.tags=(Refinery::Tags::Tag.all.sample(rand(2..Refinery::Tags::Tag.count))) }
