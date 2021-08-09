require 'rails_helper'

describe 'Dashboard' do
  before do
    sign_in user
    visit dashboard_path
  end

  context 'non admin user' do
    let(:user) { FactoryBot.create :user }

    scenario 'has stock dashboard html' do
      expect(page).to have_content "This is your Users' Dashboard"
    end

    scenario 'does not show Admin Panel' do
      expect(page).not_to have_content "Admin Panel"
    end
  end

  context 'admin user' do
    let(:user) { FactoryBot.create :user, admin: true }

    scenario 'shows Admin Panel' do
      expect(page).to have_content 'Admin Panel'
    end

    scenario 'can show Dashboard View for regular Users', :js do
      expect(page).not_to have_content "This is your Users' Dashboard"

      click_on 'Regular User Dashboard'

      expect(page).to have_content "This is your Users' Dashboard"
    end
  end
end