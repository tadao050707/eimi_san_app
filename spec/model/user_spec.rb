require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーションテスト' do
    context '名前の欄が空の場合' do
      it 'バリデーションに引っかかる' do
        user = User.new(name: '', email: 'testuser@example.com', password: 'testuser', password_confirmation: 'testuser')
        expect(user).not_to be_valid
      end
    end
    context 'emailの欄が空の場合' do
      it 'バリデーションに引っかかる' do
        user = User.new(name: 'testuser', email: '', password: 'testuser', password_confirmation: 'testuser')
        expect(user).not_to be_valid
      end
    end 
    context 'passwordの欄が空の場合' do
      it 'バリデーションに引っかかる' do
        user = User.new(name: 'testuser', email: 'tsetuser@example.com', password: '', password_confirmation: '')
        expect(user).not_to be_valid
      end
    end      
    context '全項目入力してる場合' do
      it '登録' do
        user = User.new(name: 'testuser', email: 'testuser@example.com', password: 'testuser', password_confirmation: 'testuser')
        expect(user).to be_valid
      end
    end
  end
end