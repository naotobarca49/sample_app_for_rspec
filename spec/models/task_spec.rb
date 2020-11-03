require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'validation' do
    it 'is valid with all attributes' do
      task = FactoryBot.build(:task)
      expect(task).to be_valid
      expect(task.errors).to be_empty
    end

    it 'is invalid without title' do
      task = FactoryBot.build(:task, title: nil)
      task.valid?
      expect(task.errors[:title]).to include("can't be blank")
    end

    it 'is invalid without status' do
      task = FactoryBot.build(:task, status: nil)
      task.valid?
      expect(task.errors[:status]).to include("can't be blank")
    end

    it 'is invalid with a duplicate title' do
      FactoryBot.create(:task, title: "test title")
      task = FactoryBot.build(:task, title: "test title")
      task.valid?
      expect(task.errors[:title]).to include("has already been taken")
    end

    it 'is valid with other title' do
      FactoryBot.create(:task, title: "test title")
      task = FactoryBot.build(:task, title: "test title2")
      expect(task).to be_valid
      expect(task.errors).to be_empty
    end
  end
end
