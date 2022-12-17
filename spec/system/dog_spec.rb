require 'rails_helper'
RSpec.describe 'ドッグデータ管理機能', type: :system do
  let!(:user){ FactoryBot.create(:user) }
  let!(:dog){ FactoryBot.create(:dog) }
  describe do
    before do
      visit new_user_session_path
      fill_in "user[name]", with: 'testuser'
      fill_in "user[email]",	with: 'testuser@example.com'
      fill_in "user[password]",	with: 'testuser'
      click_on "commit"
    end

    context '犬種の検索ができるとき' do
      it 'あいまい検索ができる' do
        visit search_dogs_path
        fill_in "poodle", with: '0'
        click_on "commit"
        expect(page).to have_content 'dog000000'
      end
    end
    context '犬種の検索ができるとき' do
      it 'チェックボックス検索ができる' do
        visit search_dogs_path
        check "q_active_eq"
        click_on "commit"
        expect(page).to have_content 'dog000000'
      end
    end
    context '犬種の検索ができるとき' do
      it 'セレクトボックス検索ができる' do
        visit search_dogs_path
        select "大型犬", from: 'q_size_eq'
        click_on "commit"
        expect(page).to have_content 'dog000000'
      end
    end
  end
end