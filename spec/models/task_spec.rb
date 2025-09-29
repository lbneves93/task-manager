require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:user) { User.create!(email: "test@example.com", name: "Test User", password: "password") }

  describe 'validations' do
    context 'with valid attributes' do
      it 'is valid' do
        task = Task.new(
          user: user,
          title: "Test Task",
          description: "Test Description",
          status: 0,
          due_date: 1.week.from_now
        )
        expect(task).to be_valid
      end
    end

    context 'with invalid attributes' do
      it 'is invalid without user_id' do
        task = Task.new(
          title: "Test Task",
          description: "Test Description",
          status: 0,
          due_date: 1.week.from_now
        )
        expect(task).not_to be_valid
        expect(task.errors[:user_id]).to include("can't be blank")
      end

      it 'is invalid without title' do
        task = Task.new(
          user: user,
          description: "Test Description",
          status: 0,
          due_date: 1.week.from_now
        )
        expect(task).not_to be_valid
        expect(task.errors[:title]).to include("can't be blank")
      end

      it 'is invalid without description' do
        task = Task.new(
          user: user,
          title: "Test Task",
          status: 0,
          due_date: 1.week.from_now
        )
        expect(task).not_to be_valid
        expect(task.errors[:description]).to include("can't be blank")
      end

      it 'is invalid without status' do
        task = Task.new(
          user: user,
          title: "Test Task",
          description: "Test Description",
          due_date: 1.week.from_now
        )
        expect(task).not_to be_valid
        expect(task.errors[:status]).to include("can't be blank")
      end

      it 'is invalid without due_date' do
        task = Task.new(
          user: user,
          title: "Test Task",
          description: "Test Description",
          status: 0
        )
        expect(task).not_to be_valid
        expect(task.errors[:due_date]).to include("can't be blank")
      end
    end
  end

  describe 'associations' do
    it 'belongs to user' do
      expect(Task.reflect_on_association(:user).macro).to eq(:belongs_to)
    end
  end
end
