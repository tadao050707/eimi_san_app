require 'rails_helper'
RSpec.describe 'ユーザー管理機能', type: :system do
  describe 'ユーザー新規登録機能' do
    context 'ユーザーがsign upした場合' do
      it 'user_stepの画面に遷移' do
        visit new_user_registration_path
        fill_in "user_name",with: 'testuser'
        fill_in "user_email",with: 'tesusert@gmail.com'
        fill_in "user_password",with: 'testuser'
        fill_in "user_password_confirmation",with: 'testuser'
        click_button "sign_in"
        expect(page).to have_content 'ふだんよく乗るのは？'
      end
    end 
    context 'ユーザーがログインせずに、検索画面に飛ぼうとした時' do
      it 'ログイン画面に遷移する' do
        visit new_user_session_path
        visit search_dogs_path
        expect(page).to have_content 'ログイン'
      end
    end
  end
  describe 'セッション機能' do
    before do
      FactoryBot.create(:second_user)
      visit new_user_session_path
      fill_in "user[name]",with: 'testuser2'
      fill_in "user[email]",with: 'testuser2@example.com'
      fill_in "user[password]",with: 'testuser2'
      click_on "Log in"
    end
    context 'ログインした場合' do
      it 'マイページの画面に飛ぶ' do
        click_on "Log in"
      expect(page).to have_content 'ログイン'
      end
    end
    context 'ログアウトした場合' do
      it 'ログアウトすることができる' do
        click_on "Logout"
        expect(page).to have_content 'ログアウト'
      end
    end
  end
end