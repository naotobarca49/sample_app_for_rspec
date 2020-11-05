require 'rails_helper'

RSpec.describe "UserSessions", type: :system, focus: true do
  let(:user) { create(:user) }

  describe 'ログイン前' do
    context 'フォームの入力値が正常' do
      it 'ログインに成功する' do
        visit login_path
        fill_in 'Email', with: user.email
        fill_in 'password', with: 'password'
        click_button 'Login'
        expect(page).to have_content 'Login successful'
        expect(current_path).to eq root_path
      end
    end

    context 'メールアドレスが未入力' do
      it 'ログインに失敗する' do
        visit login_path
        fill_in 'Email', with: nil
        fill_in 'password', with: 'password'
        click_button 'Login'
        expect(page).to have_content 'Login failed'
        expect(current_path).to eq login_path
      end
    end
  end

  describe 'ログイン後' do
    context 'ログアウトボタンをクリック' do
      it 'ログアウトに成功する' do
        login_as(user)
        click_link 'Logout'
        expect(page).to have_content 'Logged out'
        expect(current_path).to eq root_path
      end
    end
  end
end
