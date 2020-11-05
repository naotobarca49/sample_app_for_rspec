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
  end
end
