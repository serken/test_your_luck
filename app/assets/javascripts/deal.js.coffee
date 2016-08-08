$(document).on 'turbolinks:load', ->
  $('.make_a_bet').on 'click', ->
    bet = $('#bet_bet').val()
    $.post('/deals', { bet: bet })
