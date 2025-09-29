require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  let(:user) { User.create!(email: "test@example.com", name: "Test User", password: "password") }
  let(:valid_attributes) do
    {
      task: {
        user_id: user.id,
        title: "Test Task",
        description: "Test Description",
        status: 0,
        due_date: 1.week.from_now
      }
    }
  end
  let(:invalid_attributes) do
    {
      task: {
        user_id: user.id,
        title: "",
        description: "",
        status: nil,
        due_date: nil
      }
    }
  end

  describe "GET /tasks" do
    it "returns all tasks" do
      task = Task.create!(valid_attributes[:task])
      get tasks_path
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)["data"]).to be_an(Array)
    end
  end

  describe "GET /tasks/:id" do
    it "returns a specific task" do
      task = Task.create!(valid_attributes[:task])
      get task_path(task)
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)["data"]["id"]).to eq(task.id.to_s)
    end

    it "returns 404 for non-existent task" do
      get task_path(999)
      expect(response).to have_http_status(:not_found)
    end
  end

  describe "POST /tasks" do
    context "with valid parameters" do
      it "creates a new task" do
        expect {
          post tasks_path, params: valid_attributes
        }.to change(Task, :count).by(1)
        expect(response).to have_http_status(:ok)
      end
    end

    context "with invalid parameters" do
      it "returns 400 with errors" do
        post tasks_path, params: invalid_attributes
        expect(response).to have_http_status(:bad_request)
        expect(JSON.parse(response.body)).to have_key("errors")
      end
    end
  end

  describe "PATCH /tasks/:id" do
    let(:task) { Task.create!(valid_attributes[:task]) }

    context "with valid parameters" do
      it "updates the task" do
        patch task_path(task), params: { task: { title: "Updated Title" } }
        expect(response).to have_http_status(:ok)
        expect(task.reload.title).to eq("Updated Title")
      end
    end

    context "with invalid parameters" do
      it "returns 400 with errors" do
        patch task_path(task), params: { task: { title: "" } }
        expect(response).to have_http_status(:bad_request)
        expect(JSON.parse(response.body)).to have_key("errors")
      end
    end
  end

  describe "DELETE /tasks/:id" do
    it "deletes the task" do
      task = Task.create!(valid_attributes[:task])
      expect {
        delete task_path(task)
      }.to change(Task, :count).by(-1)
      expect(response).to have_http_status(:no_content)
    end
  end
end
