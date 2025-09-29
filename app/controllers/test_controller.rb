class TestController < ActionController::API
  def index
    render json: { message: "Hello World" }
  end
end
