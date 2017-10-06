class Bookmarksystem.Views.BookmarksIndex extends Backbone.View

  template: JST['bookmarks/index']

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
    #if @model.get('archive')== true
     # $(view.el).addClass('archived')
    $('#bookmarks').prepend(view.render().el)
  
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
  #search:(e) ->
   # console.log("jhvjvbjhvj")
   # e.preventDefault();
   # e.stopPropagation();
    #Bookmarksystem.d.navigate('#search', {trigger: true});
    
  #favour:(e) ->
    #console.log("jhvjvbjhvj")
    #e.preventDefault();
    #e.stopPropagation();
    #Bookmarksystem.d.navigate('#favour', {trigger: true});
    
  
  #home:(e) ->
   # console.log("jhvjvbjhvj")
    #e.preventDefault();
    #e.stopPropagation();
    #Bookmarksystem.d.navigate('#', {trigger: true});
    

  