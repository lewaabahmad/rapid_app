require 'rails_helper'

RSpec.describe "pages/edit", type: :view do
  before(:each) do
    @page = assign(:page, Page.create!(
      title: "MyString",
      description: "MyText",
      is_homepage: false,
      is_dashboard: false,
      requires_authentication: false,
      header_html: "MyText",
      is_in_nav: false,
      body_html: "MyText",
      url: "MyString"
    ))
  end

  it "renders the edit page form" do
    render

    assert_select "form[action=?][method=?]", page_path(@page), "post" do

      assert_select "input[name=?]", "page[title]"

      assert_select "textarea[name=?]", "page[description]"

      assert_select "input[name=?]", "page[is_homepage]"

      assert_select "input[name=?]", "page[is_dashboard]"

      assert_select "input[name=?]", "page[requires_authentication]"

      assert_select "textarea[name=?]", "page[header_html]"

      assert_select "input[name=?]", "page[is_in_nav]"

      assert_select "textarea[name=?]", "page[body_html]"

      assert_select "input[name=?]", "page[url]"
    end
  end
end
