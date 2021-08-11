require 'rails_helper'

describe 'Pages that require Authentication' do
  let(:public_page) { FactoryBot.create :page, requires_authentication: false, url: 'public' }
  let(:private_page) { FactoryBot.create :page, requires_authentication: true, url: 'private' }

  context 'non-authed user' do
    scenario 'can access public pages' do
      visit public_page.url

      expect(page).to have_content "MyBody"
    end

    scenario 'can not access private pages' do
      visit private_page.url

      expect(page).to have_content "You need to sign in or sign up before continuing."
      expect(page).to have_content "Sign up"
    end
  end


  context 'authed user' do
    let(:user) { FactoryBot.create :user }

    before do
      sign_in user
    end

    scenario 'can access public pages' do
      visit public_page.url

      expect(page).to have_content "MyBody"
    end

    scenario 'can access private pages' do
      visit private_page.url

      expect(page).to have_content "MyBody"
    end
  end
end