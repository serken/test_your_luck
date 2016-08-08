$(document).on 'turbolinks:load', ->
  $('.make_deposit').on 'click', ->
    $.post($(@).data('href'), {amount: $('#deposit_amount').val() })

  $('.make_withdraw').on 'click', ->
    $.post($(@).data('href'), {amount: $('#withdraw_amount').val() })
