# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $(document).on "turbolinks:load", ->
    # Dropdown select for transaction's customer
    $('#transaction_customer_id').select2
      theme: 'bootstrap'
      minimumInputLength: 2
      placeholder: 'Search for customer by name'
      allowClear: true

    # Dropdown select for commodity_item's commodity_id
    $('#commodity_item_commodity_id').select2
      theme: 'bootstrap'
      #minimumInputLength: 2
      #placeholder: 'Search for customer by name'
      #allowClear: true