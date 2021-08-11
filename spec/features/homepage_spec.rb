require 'rails_helper'

describe 'Homepage' do
  before do
    visit root_path
  end

  scenario 'has stock homepage html' do
    expect(page).to have_content "Welcome to your Web App"
  end

  scenario 'is instantiated along with the stock About page' do
    click_on 'About'

    expect(page).to have_content "You should change this to match something you'd expect for your Web App."
  end

  scenario 'is instantiated along with the stock Pricing page' do
    click_on 'Pricing'

    expect(page).to have_content "Enterprise"
  end
end