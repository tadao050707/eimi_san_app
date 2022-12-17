require 'rails_helper'
RSpec.describe 'ウィザード形式の選択', type: :system do
  let!(:user) { FactoryBot.create(:user) }
  describe do
    before do
      visit new_user_session_path
      fill_in "user_name", with: 'testuser'
      fill_in "user_email",	with: 'testuser@example.com'
      fill_in "user_password",	with: 'testuser'
      click_on "Log in"
    end
    describe do
      context 'セッション機能' do
        it '次のページへ移動' do
          visit first_user_steps_path
          choose('user_choice_vehicle_car')
          click_button "次へ"
          expect(page).to have_content 'こまめな掃除が'
        end
      end
    end
  end
end
