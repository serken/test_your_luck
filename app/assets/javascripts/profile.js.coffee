$(document).on 'turbolinks:load', ->
  $('.make_deposit_test').on 'click', ->
    $.post($(@).data('href'), {amount: $('#deposit_amount').val() })

  $('.make_withdraw').on 'click', ->
    $.post($(@).data('href'), {amount: $('#withdraw_amount').val() })

  $('.make_deposit').on 'click', ->
    amount = $('#deposit_amount').val()
    $.post('/prepare_payment', { amount: amount})
    .success (data) ->
      window.location = 'https://payeer.com/merchant/?' + jQuery.param(data) +
      '&form[ps]=2609&form[curr[2609]]&m_process=send'

