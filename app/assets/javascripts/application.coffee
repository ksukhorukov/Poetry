#= require jquery
#= require jquery_ujs
#= require twitter/bootstrap
#= require_tree .


catch_keywords = ($input, $output) ->
  $this = $input
  clearTimeout document.poems_blog.timeouts.poem if document.poems_blog.timeouts.poem
  document.poems_blog.timeouts.poem = setTimeout (->
    text = $this.val()
    $.each document.poems_blog.tags, (i, v) ->
      if text.match(v.name) && $output.val().match(v.name) == null

        if $output.val().length > 0
          new_data_tags_field_val = $output.val() + ', ' + v.name
        else
          new_data_tags_field_val = v.name

        if $('#tags_id').val().length > 0
          $('#tags_id').val($('#tags_id').val()  + ',' + v.id)
        else
          $('#tags_id').val(v.id)

        $output.val new_data_tags_field_val

  ), 1000

$ ->
  document.poems_blog = {}
  document.poems_blog.timeouts = {}

  document.poems_blog.tags = []

  if $('[data-tags-json]').length > 0
    document.poems_blog.tags = $.parseJSON $('[data-tags-json]').text()

  if $('[data-content-input]').length > 0
    $('[data-content-input]').on 'keyup', ->
      catch_keywords $(@), $('[data-tags-field]')



