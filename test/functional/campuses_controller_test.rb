require 'test_helper'

class CampusesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:campuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create campuse" do
    assert_difference('Campuse.count') do
      post :create, :campuse => { }
    end

    assert_redirected_to campuse_path(assigns(:campuse))
  end

  test "should show campuse" do
    get :show, :id => campuses(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => campuses(:one).to_param
    assert_response :success
  end

  test "should update campuse" do
    put :update, :id => campuses(:one).to_param, :campuse => { }
    assert_redirected_to campuse_path(assigns(:campuse))
  end

  test "should destroy campuse" do
    assert_difference('Campuse.count', -1) do
      delete :destroy, :id => campuses(:one).to_param
    end

    assert_redirected_to campuses_path
  end
end
