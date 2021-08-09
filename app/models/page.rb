class Page < ApplicationRecord


  def self.homepage
    page = Page.find_by(is_homepage: true)
    page = Page.generate_homepage unless page
    page
  end

  def self.dashboard
    page = Page.find_by(is_dashboard: true)
    page = Page.generate_dashboard unless page
    page
  end

  def self.generate_homepage
    contents = File.read(File.join(Rails.root, "/html_pages/dashboard.html"))
    create!(
      title: "Homepage",
      description: 'This is the Homepage of your application - what your users see when they first visit your App.',
      is_homepage: true,
      is_dashboard: false,
      requires_authentication: true,
      is_in_nav: false,
      body_html: contents,
      url: '/'
    )
  end

  def self.generate_dashboard
    contents = File.read(File.join(Rails.root, "/html_pages/dashboard.html"))
    create!(
      title: "Dashboard",
      description: 'This is the Dashboard of your application - what your users first see when they log in.',
      is_homepage: false,
      is_dashboard: true,
      requires_authentication: true,
      is_in_nav: false,
      body_html: contents,
      url: '/dashboard'
    )
  end
end
