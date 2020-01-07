require 'test_helper'

class CathegoriesControllerTest < ActionController::TestCase
  setup do
    @cathegory = cathegories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cathegories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cathegory" do
    assert_difference('Cathegory.count') do
      post :create, cathegory: { level: @cathegory.level, logo: @cathegory.logo, name: @cathegory.name, parent_id: @cathegory.parent_id, parent_link: @cathegory.parent_link, type: @cathegory.type, visible: @cathegory.visible }
    end

    assert_redirected_to cathegory_path(assigns(:cathegory))
  end

  test "should show cathegory" do
    get :show, id: @cathegory
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cathegory
    assert_response :success
  end

  test "should update cathegory" do
    patch :update, id: @cathegory, cathegory: { level: @cathegory.level, logo: @cathegory.logo, name: @cathegory.name, parent_id: @cathegory.parent_id, parent_link: @cathegory.parent_link, type: @cathegory.type, visible: @cathegory.visible }
    assert_redirected_to cathegory_path(assigns(:cathegory))
  end

  test "should destroy cathegory" do
    assert_difference('Cathegory.count', -1) do
      delete :destroy, id: @cathegory
    end

    assert_redirected_to cathegories_path
  end
end
