Refinery::I18n.frontend_locales.each do |lang|
  I18n.locale = lang

  Refinery::User.find_each do |user|
    user.plugins.where(name: 'refinerycms-organization_tabs').first_or_create!(
      position: (user.plugins.maximum(:position) || -1) +1
    )
  end if defined?(Refinery::User)

  Refinery::Page.where(link_url: (url = "/organization_tabs")).first_or_create!(
    title: 'Organization Tabs',
    deletable: false,
    menu_match: "^#{url}(\/|\/.+?|)$"
  ) do |page|
    Refinery::Pages.default_parts.each_with_index do |part, index|
      page.parts.build title: part[:title], slug: part[:slug], body: nil, position: index
    end
  end if defined?(Refinery::Page)
end

Refinery::OrganizationTabs::OrganizationTab.destroy_all

Refinery::OrganizationTabs::OrganizationTab.create(tab_name: "BUSINESS", body: "<p>FSE has a business philosophy that pursues technical excellence in structural engineering by developing and working with teams of people who recognize that the best projects are those that are refined through an organic process where each member listens and responds to the needs of the Client as well as the end user. At the end of the day, we sleep well knowing that we have contributed to the teams we join, and helped other people as well as ourselves grow professionally and personally.</p>

<p>Our goal is to do business well by teaming with a network of diverse clients who want to deliver the best solutions for each situation. It is through our work and personal team-mate relationships that we find opportunities to serve others. It is in our service that our business flourishes. As our business flourishes, we are enabled to help others grow in various ways.</p>")
Refinery::OrganizationTabs::OrganizationTab.create(tab_name: "CULTURE", body: "<p>“Forefront” refers to several intrinsic qualities of our firm. Our goal is to be at the forefront of our profession by setting the modern standard of structural engineering excellence. We accomplish this with new techniques and solutions guided by the context of history and experience. Our name also reflects our corporate and personal commitment to reach the world through our profession. Our work, our people, and our vision extend globally.</p>

<p>Every project begins with an idea, and every idea begins with a person. The summation of talented people and servant-leadership is the source of great collaboration. Our work is not about individuals, but rather teams comprised of unique individuals seeking one goal—developing the right solution for each problem. These solutions apply to our work, our lives, and the lives of those that we interact with.</p>")
