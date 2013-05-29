require 'test_helper'

class HolasControllerTest < ActionController::TestCase
  setup do
    @hola = holas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:holas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hola" do
    assert_difference('Hola.count') do
      post :create, hola: {  }
    end

    assert_redirected_to hola_path(assigns(:hola))
  end

  test "should show hola" do
    get :show, id: @hola
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hola
    assert_response :success
  end

  test "should update hola" do
    put :update, id: @hola, hola: {  }
    assert_redirected_to hola_path(assigns(:hola))
  end

  test "should destroy hola" do
    assert_difference('Hola.count', -1) do
      delete :destroy, id: @hola
    end

    assert_redirected_to holas_path
  end
end
