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

    $('#hypercom_charge_button').on 'click', ->
      amount = $(this).data( "amount" )
      workstation_id = $(this).data( "workstation-id" )
      spinner_icon = $(this).find('.fa-spinner')
      spinner_icon.show()
      charge_button = $(this)
      charge_button.addClass( "disabled" )
      $.ajax
        url: "/devices/pos_payment"
        dataType: 'json'
        data:
          amount: amount
          workstation_id: workstation_id
        timeout: 20000 # Timeout after 20 seconds
        success: (data) ->
          spinner_icon.hide()
          return_response = data.response.return
          tran_id = data.response.tran_id
          console.log 'return_response:', return_response
          console.log 'tran_id:', tran_id
          if return_response is '0'
            alert "Debit of $" + amount.toFixed(2) + " approved."
            $('#transaction_ez_cash_tran_id').val tran_id
            $('.edit_transaction').submit() 
          else if return_response is '612'
            $(this).removeClass( "disabled" )
            alert "Insuffcient funds."
          else
            charge_button.removeClass( "disabled" )
            alert "Debit of $" + amount.toFixed(2) + " was not approved."
          return
        error: (xhr, status, err) ->
          charge_button.removeClass( "disabled" )
          spinner_icon.hide()
          alert 'Error calling Hypercom: ' + status
          return
      return
