$ ->

  $('.actions').on 'click', ->

    $.get($(@).data('href'))
      .success (data)->
        $('.inner_loads').html(data)
        $('.deposit').on 'click', ->
          $.post($(@).data('href'), {amount: $('#amount_amount').val() })
        $('.withdraw').on 'click', ->
          $.post($(@).data('href'), {amount: $('#amount_amount').val() })
