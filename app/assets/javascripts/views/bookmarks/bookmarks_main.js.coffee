class Bookmarksystem.Views.BookmarksMain extends Backbone.View

  template: JST['bookmarks/main']

  events:
   'submit #new_bookmark': 'createBookmark'

  initialize: ->
    @collection.on('reset', @render, @)
    @collection.on('add', @appendNewBookmark, @)
   
  render: ->
    $(@el).html(@template())
    @appendForm()
    @collection.each(@appendBookmark)
    @  

  appendBookmark: (bookmark) ->
    view = new Bookmarksystem.Views.Bookmark(model: bookmark)
    $('#bookmarks').append(view.render().el)
  
  appendForm: ->
    $(@el).find('#new_bookmark').html(JST['bookmarks/form']())

  
  appendNewBookmark: (bookmark) ->
    @appendForm()
    @appendBookmark(bookmark)


  createBookmark: (event) ->
    event.preventDefault()
    if $('#new_title').val()
      @collection.create (title: $('#new_title').val(), urlname: $('#new_urlname').val(),favourite: 'false',archive: 'false')
    else
      alert "please enter bookmark...!"

