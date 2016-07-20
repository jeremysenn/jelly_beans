require 'test_helper'

class CommodityItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @commodity_item = commodity_items(:one)
  end

  test "should get index" do
    get commodity_items_url
    assert_response :success
  end

  test "should get new" do
    get new_commodity_item_url
    assert_response :success
  end

  test "should create commodity_item" do
    assert_difference('CommodityItem.count') do
      post commodity_items_url, params: { commodity_item: { commodity_id: @commodity_item.commodity_id, gross: @commodity_item.gross, price: @commodity_item.price, tare: @commodity_item.tare, total: @commodity_item.total, transaction_id: @commodity_item.transaction_id } }
    end

    assert_redirected_to commodity_item_url(CommodityItem.last)
  end

  test "should show commodity_item" do
    get commodity_item_url(@commodity_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_commodity_item_url(@commodity_item)
    assert_response :success
  end

  test "should update commodity_item" do
    patch commodity_item_url(@commodity_item), params: { commodity_item: { commodity_id: @commodity_item.commodity_id, gross: @commodity_item.gross, price: @commodity_item.price, tare: @commodity_item.tare, total: @commodity_item.total, transaction_id: @commodity_item.transaction_id } }
    assert_redirected_to commodity_item_url(@commodity_item)
  end

  test "should destroy commodity_item" do
    assert_difference('CommodityItem.count', -1) do
      delete commodity_item_url(@commodity_item)
    end

    assert_redirected_to commodity_items_url
  end
end
