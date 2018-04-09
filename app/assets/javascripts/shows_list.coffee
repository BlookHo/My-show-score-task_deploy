# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
class ReviewsList
  window.reviews_list = () ->
    $.ajax(
      type: 'get'
      url: 'api/v1/reviews_list'
      data: {}
      dataType: 'json').done((data_return) ->
      sleep 1.5
      showsList = data_return.shows
      i = 0
      while i <= 9
        dataId = 'tr[data-id=' + i + ']' + ' td[data-column='
        $(dataId + '"title"]').html showsList[i].title
        $(dataId + '"score"]').html showsList[i].ave_score
        $(dataId + '"count"]').html showsList[i].review_count
        i++
      return
    ).fail (data_return) ->
      console.log 'error: data_return = ' + data_return
      return
    return
