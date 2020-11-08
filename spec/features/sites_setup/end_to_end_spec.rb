# frozen_string_literal: true

require 'rails_helper'

feature 'As a non-logged-in visitor' do
  context 'when I visit the home page' do
    scenario 'I should be able to create a site and my user account' do
      visit root_path
      fill_in :site_name, with: 'ExampleSiteName'
      click_button 'Create Site'

      click_link 'Skip to Step 3'

      fill_in :user_email, with: 'exampleemail@example.com'
      fill_in :user_password, with: 'h826;!jklwe'

      click_button 'Sign up'

      expect(page).to have_content('Your user account has been created!')
    end
  end
end
