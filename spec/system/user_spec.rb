require 'rails_helper'
RSpec.describe 'ユーザー管理機能', type: :system do
  describe 'ユーザー新規登録機能' do
    context 'ユーザーがsign upした場合' do
      it 'user_stepの画面に遷移' do
        visit new_user_registration_path
        fill_in "user_name",with: 'testuser'
        fill_in "user_email",with: 'testuser@example.com'
        fill_in "user_password",with: 'testuser'
        fill_in "user_password_confirmation",with: 'testuser'
        click_on "sign_in"
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
      FactoryBot.create(:user)
      visit new_user_session_path
      fill_in "user_name",with: 'testuser'
      fill_in "user_email",with: 'testuser@example.com'
      fill_in "user_password",with: 'testuser'
      click_on "Log in"
    end
    context 'ログインした場合' do
      it 'マイページの画面に飛ぶ' do
      expect(page).to have_content 'マイページ'
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