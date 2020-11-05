require 'rails_helper'

RSpec.describe "Tasks", type: :system, focus: true do
  let(:user) { create(:user) }
  let(:task) { create(:task) }

  describe 'ログイン前' do
    describe 'ページ遷移確認' do
      context 'タスクの新規登録ページにアクセス' do
        it '新規登録ページのアクセスが失敗する' do
          visit new_task_path
          expect(page).to have_content 'Login required'
          expect(current_path).to eq login_path
        end
      end

      context 'タスクの編集ページにアクセス' do
        it '編集ページのアクセスが失敗する' do
          visit edit_task_path(task)
          expect(page).to have_content 'Login required'
          expect(current_path).to eq login_path
        end
      end
    end
  end

  describe 'ログイン後' do
    before { login_as(user) }

    describe 'ページ遷移確認' do
      context 'タスクの新規登録ページにアクセス' do
        it '新規登録ページのアクセスが成功する' do
          click_link 'New task'
          expect(current_path).to eq new_task_path
        end
      end
    end
  end
end
