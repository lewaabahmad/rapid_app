class Page < ApplicationRecord

  def self.generate_dashboard
    contents = File.read(File.join(Rails.root, "/html_pages/dashboard.html"))
    create!(
      title: "Dashboard",
      description: 'This is the Dashboard of your application - what your users first see whenn they log in.',
      is_homepage: false,
      is_dashboard: true,
      requires_authentication: true,
      is_in_nav: false,
      body_html: contents,
      url: '/dashboard'
    )
  end
end
