# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $(document).on "turbolinks:load", ->
    # Dropdown select for transaction's customer
    if !$('#transaction_customer_id').hasClass('select2-hidden-accessible') # Don't invoke select2 if already applied
      $('#transaction_customer_id').select2
        theme: 'bootstrap'
        minimumInputLength: 2
        placeholder: 'Search for customer by name'
        allowClear: true

    # Dropdown select for commodity_item's commodity_id
    if !$('#commodity_item_commodity_id').hasClass('select2-hidden-accessible') # Don't invoke select2 if already applied
      $('#commodity_item_commodity_id').select2
        theme: 'bootstrap'
        #minimumInputLength: 2
        #placeholder: 'Search for customer by name'
        #allowClear: true

    ### Autofocus within modals ###
    $('#add_commodity_item').on 'shown.bs.modal', ->
      #$(this).find("[autofocus]:first").focus()
      $('#commodity_item_commodity_id').focus()
      return
    $('#change_customer').on 'shown.bs.modal', ->
      #$(this).find("[autofocus]:first").focus()
      $('#transaction_customer_id').focus()
      return
    $('#change_discount').on 'shown.bs.modal', ->
      $(this).find("[autofocus]:first").focus()
      return
    $('#attachment').on 'shown.bs.modal', ->
      $(this).find("[autofocus]:first").focus()
      #$('#myInput').focus()
      return
