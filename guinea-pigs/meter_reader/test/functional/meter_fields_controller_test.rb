require 'test_helper'

class MeterFieldsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:meter_fields)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create meter_field" do
    assert_difference('MeterField.count') do
      post :create, :meter_field => { }
    end

    assert_redirected_to meter_field_path(assigns(:meter_field))
  end

  test "should show meter_field" do
    get :show, :id => meter_fields(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => meter_fields(:one).to_param
    assert_response :success
  end

  test "should update meter_field" do
    put :update, :id => meter_fields(:one).to_param, :meter_field => { }
    assert_redirected_to meter_field_path(assigns(:meter_field))
  end

  test "should destroy meter_field" do
    assert_difference('MeterField.count', -1) do
      delete :destroy, :id => meter_fields(:one).to_param
    end

    assert_redirected_to meter_fields_path
  end
end
