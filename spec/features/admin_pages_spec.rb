require 'rails_helper'

describe 'Pages that require Authentication' do
  admin_pages = [
    '/admin/pages',
    "/admin/pages/new",
    "/admin/pages/#{FactoryBot.create(:page).id}/edit"
  ]

  let(:admin_notice) { "You can't go there without being an Admin." }

  context 'non-authed user' do
    admin_pages.each do |admin_page|
      scenario 'can not access admin pages' do
        visit admin_page

        expect(page).to have_content "Sign up"
      end
    end
  end

  context 'authed non-admin user' do
    let(:user) { FactoryBot.create :user }

    before do
      sign_in user
    end

    admin_pages.each do |admin_page|
      scenario 'can not access admin pages' do
        visit admin_page
  
        expect(page).to have_content admin_notice
        expect(current_path).to eq root_path
      end
    end
  end


  context 'authed admin user' do
    let(:user) { FactoryBot.create :user, admin: true }

    before do
      sign_in user
    end

    admin_pages.each do |admin_page|
      scenario 'can not access admin pages' do
        visit admin_page
  
        expect(page).not_to have_content admin_notice
        expect(current_path).to eq admin_page
      end
    end
  end
end