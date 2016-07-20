# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class CommodityItemsChannel < ApplicationCable::Channel
#  def self.broadcast(commodity_item)
#    broadcast_to commodity_item.txn, commodity_item:
#      CommodityItemsController.render(partial: 'commodity_items/commodity_item', locals: { commodity_item: commodity_item})
#  end
  
  def subscribed
    # stream_from "some_channel"
#    stream_for Transaction.first
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
