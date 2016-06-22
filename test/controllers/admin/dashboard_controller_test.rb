module Admin
  class DashboardControllerTest < ActionController::TestCase
    include Devise::TestHelpers

    test "rejects non-authenticated access" do
      get :index
      assert_response :redirect
      assert_equal "Not available.", flash[:error]
    end

    test "rejects non-administrators" do
      user = User.create(
        email: "normal-user@example.org",
        password: "password",
        password_confirmation: "password",
        confirmed_at: Date.today
      )

      sign_in user

      get :index
      assert_response :redirect
      assert_equal "Not available.", flash[:error]
    end

    test "allows administrators" do
      user = User.create(
        email: "normal-user@example.org",
        password: "password",
        password_confirmation: "password",
        confirmed_at: Date.today
      )

      user.roles = ['admin']
      user.save

      sign_in user

      get :index
      assert_response :success
    end
  end
end
