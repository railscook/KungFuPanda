require 'test_helper'

class AttachedAssetsControllerTest < ActionController::TestCase
  setup do
    @attached_asset = attached_assets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attached_assets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create attached_asset" do
    assert_difference('AttachedAsset.count') do
      post :create, attached_asset: { asset_file_name: @attached_asset.asset_file_name }
    end

    assert_redirected_to attached_asset_path(assigns(:attached_asset))
  end

  test "should show attached_asset" do
    get :show, id: @attached_asset
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @attached_asset
    assert_response :success
  end

  test "should update attached_asset" do
    put :update, id: @attached_asset, attached_asset: { asset_file_name: @attached_asset.asset_file_name }
    assert_redirected_to attached_asset_path(assigns(:attached_asset))
  end

  test "should destroy attached_asset" do
    assert_difference('AttachedAsset.count', -1) do
      delete :destroy, id: @attached_asset
    end

    assert_redirected_to attached_assets_path
  end
end
