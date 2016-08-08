$(document).on 'turbolinks:load', ->
  $('.make_a_bet').on 'click', ->
    bet = $('#bet_bet').val()
    $.post('/deals', { bet: bet })
  $('.accept_deal').on 'click', ->
    id = $(@).attr('deal_id')
    $.post("/deals/#{id}/accept_deal")
