# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# setTimeout(alert, 3000)

@RlsFileProgressPoller =
  poll: ->
    setTimeout @request, 2000
  request: ->
    pb = $('#progress-bar')
    if pb.attr('data-job_id')? 
      $.get(pb.attr('data-url') + pb.attr('data-job_id'))

jQuery ->
  $('#new_rls_file').fileupload

    dataType: 'script'

    add: (e, data) ->
      $('.progress').remove()
      data.context = $(tmpl("template-upload", data.files[0]))
      $('#progress-bar').append(data.context)
      data.submit()

    progress: (e, data) ->
      if data.context
        progress = parseInt(data.loaded / data.total * 100, 10)
        data.context.find('.progress-bar').css('width', progress + '%')
