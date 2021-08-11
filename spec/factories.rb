FactoryBot.define do
  factory :page do
    title { "MyString" }
    description { "MyText" }
    is_homepage { false }
    is_dashboard { false }
    requires_authentication { false }
    header_html { "MyText" }
    is_in_nav { false }
    body_html { "MyBody" }
    url { "MyString" }
  end

  factory :user do
    email { FFaker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
