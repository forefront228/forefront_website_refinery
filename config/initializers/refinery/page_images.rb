Refinery::PageImages.configure do |config|
  config.captions = true
  config.enable_for = [
    {:model=>"Refinery::Page", :tab=>"Refinery::Pages::Tab"},
    {:model=>"Refinery::Projects::Project", :tab=>"Refinery::Projects::Tab"},
    {:model=>"Refinery::TeamMembers::TeamMember", :tab=>"Refinery::TeamMembers::Tab"}
  ]
  config.wysiwyg = true
end
