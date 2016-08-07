$ ->
  $('.actions').on 'click', ->
    $('.inner_loads').hide()
    id = @.id
    $('.' + id).show()

  $('.make_deposit').on 'click', ->
    $.post($(@).data('href'), {amount: $('#deposit_amount').val() })
      .success ->
        window.location.href = '/profile'

  $('.make_withdraw').on 'click', ->
    $.post($(@).data('href'), {amount: $('#withdraw_amount').val() })
      .success ->
        window.location.href = '/profile'
