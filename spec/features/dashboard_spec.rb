require 'rails_helper'

describe 'Dashboard' do
  before do
    sign_in user
  end

  context 'non admin user' do
    let(:user) { FactoryBot.create :user }

    before do
      visit dashboard_path
    end

    scenario 'has stock dashboard html' do
      expect(page).to have_content 'This is what your users will see when they first log in.'
    end
  end

  context 'admin user' do
    let(:user) { FactoryBot.create :user, admin: true }

    before do
      visit dashboard_path
    end

    scenario 'has link to /admin/users' do
      expect(page).to have_link 'Users', href: admin_users_path
    end

    scenario 'has link to /admin/pages' do
      expect(page).to have_link 'Pages', href: admin_pages_path
    end
  end
end