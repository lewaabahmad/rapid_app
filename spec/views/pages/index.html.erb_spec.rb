require 'rails_helper'

RSpec.describe "pages/index", type: :view do
  before(:each) do
    assign(:pages, [
      Page.create!(
        title: "Title",
        description: "MyText",
        is_homepage: false,
        is_dashboard: false,
        requires_authentication: false,
        header_html: "MyText",
        is_in_nav: false,
        body_html: "MyText",
        url: "Url"
      ),
      Page.create!(
        title: "Title",
        description: "MyText",
        is_homepage: false,
        is_dashboard: false,
        requires_authentication: false,
        header_html: "MyText",
        is_in_nav: false,
        body_html: "MyText",
        url: "Url"
      )
    ])
  end

  it "renders a list of pages" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "Url".to_s, count: 2
  end
end
