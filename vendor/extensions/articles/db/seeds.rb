Refinery::I18n.frontend_locales.each do |lang|
  I18n.locale = lang

  Refinery::User.find_each do |user|
    user.plugins.where(name: 'refinerycms-articles').first_or_create!(
      position: (user.plugins.maximum(:position) || -1) +1
    )
  end if defined?(Refinery::User)

  Refinery::Page.where(link_url: (url = "/articles")).first_or_create!(
    title: 'Articles',
    deletable: false,
    menu_match: "^#{url}(\/|\/.+?|)$"
  ) do |page|
    Refinery::Pages.default_parts.each_with_index do |part, index|
      page.parts.build title: part[:title], slug: part[:slug], body: nil, position: index
    end
  end if defined?(Refinery::Page)
end

Refinery::Articles::Article.destroy_all

if Rails.env.downcase != "production"
  Refinery::Articles::Article.create(
  content: "Forefront Structural Engineers tours some of our west loop projects including:  1K Fulton Google, ACE Hotel, Hoxton Hotel, 900 W Randolph, 832 W. Fulton, 820 W. Fulton,  801 W Fulton, 942 W. Fulton, 905 W. Fulton, 176 N. Halsted...and there are more coming!  Thanks to all our collaborators:  GREC Architects  Hartshorne Plunkard Architecture OKW Architects Sterling Bay Convexity Properties - a DRW Company SHAPACK PARTNERS Focus Development, Inc. and Focus Construction, Inc.",
  submitted_url: "http://image-store.slidesharecdn.com/c6cb8c42-e75e-4fad-a11a-fb143a2b423f-original.jpeg",
  image_url: "http://image-store.slidesharecdn.com/c6cb8c42-e75e-4fad-a11a-fb143a2b423f-original.jpeg",
  linkedin_timestamp: "1497452537000",
  shortened_url: "http://image-store.slidesharecdn.com/c6cb8c42-e75e-4fad-a11a-fb143a2b423f-original.jpeg")

  Refinery::Articles::Article.create(
  content: "Forefront Structural Engineers is thankful to join JGMA and @esperanza health center  for another transformative project on the southwest side of Chicago, proving once again that under-resourced neighborhoods can benefit from bold architecture.\n\nCheck out this video describing the project\n\nhttps://lnkd.in/eS6xCSm",
  submitted_url: "https://www.youtube.com/watch?v=2l7-yKhm2x8",
  video_embed: "<iframe src=\"//www.youtube.com/embed/2l7-yKhm2x8\" frameborder=\"0\" allowfullscreen=\"allowfullscreen\"></iframe>",
  image_url: "https://media.licdn.com/media-proxy/ext?w=480&h=360&f=n&hash=aJZzc%2FbHvYgxJtOM9vnIkYCrMNk%3D&ora=1%2CaFBCTXdkRmpGL2lvQUFBPQ%2CxAVta5g-0R6j3QIOyxEmrq2OoACm7QgVSdWRG0v5Bifi8srYISO8L5aaJfa__h1B",
  linkedin_timestamp: "1497014824000",
  shortened_url: "https://lnkd.in/eS6xCSm")

  Refinery::Articles::Article.create(
  content: "Forefront Structural Engineers and JGMA are teaming up with @condorpartners and @integrated construction to deliver (2) transformational 100,000  SF heavy timber buildings in the fast growing Pilsen neighborhood of Chicago's west side.  Stay tuned for details!\n\nhttps://www.muralpark.com/",
  submitted_url: "https://www.muralpark.com/",
  image_url: "http://image-store.slidesharecdn.com/c8614bb2-4c5c-4c23-b5e5-2781af6a91e5-original.jpeg",
  linkedin_timestamp: "1496895071000",
  shortened_url: "https://www.muralpark.com/")

  Refinery::Articles::Article.create(
  content: "Forefront Structural Engineers is thankful to come home with two merit awards from the 2017 SEAOI Award Ceremony:  The Robey + Hollander Hotel (Adaptive Re-use) and The Viceroy Hotel (New Construction).  All made possible by our clients.  Thanks for believing in us as your \"X\" Factor year after year.  We are truly grateful!",
  submitted_url: "http://image-store.slidesharecdn.com/e60d2985-191d-4492-901b-d1b95f8a4a03-original.jpeg",
  image_url: "http://image-store.slidesharecdn.com/e60d2985-191d-4492-901b-d1b95f8a4a03-original.jpeg",
  linkedin_timestamp: "1496688172000",
  shortened_url: "http://image-store.slidesharecdn.com/e60d2985-191d-4492-901b-d1b95f8a4a03-original.jpeg")
end
