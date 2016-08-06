$ ->
  $('.actions').on 'click', ->

    $.get($(@).data('href'))
      .success (data)->
        $('.inner_loads').html(data)
