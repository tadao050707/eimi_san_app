require 'rails_helper'
RSpec.describe 'ウィザード形式の選択', type: :system do
  let!(:user){FactoryBot.create(:user)}
  describe 'クラス一覧CRUD機能' do 
    before do
      visit new_user_session_path
      fill_in "user[name]",with: 'testuser'
      fill_in "user[email]",with: 'testuser@sample.com'
      fill_in "user[password]",with: 'testusers'
      click_button "sign_in"
       "Log in"
    end

    context '車をクリック、次へをクリックすると' do
      it '次のページへ移動' do
        visit first_steps_path
        click_on "car"
        expect(page).to have_content ''
      end