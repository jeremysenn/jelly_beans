App.commodity_items = App.cable.subscriptions.create "CommodityItemsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    $('#commodity_items').append data.commodity_item
