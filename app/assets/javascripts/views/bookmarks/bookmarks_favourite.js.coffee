class Bookmarksystem.Views.BookmarksFavourite extends Backbone.View

  template: JST['bookmarks/favourite']

  events:
    'click .favourite' : 'addTofavourite'


  #events:
    #'submit #new_bookmark': 'createBookmark'
  initialize: ->
    @collection.on('reset', @render, @)
    #@collection.on('add', @appendNewBookmark, @)

  render: ->
    $(@el).html(@template(bookmarks: @collection))
    @  

  addTofavourite: (e)->
    element = $(e.currentTarget)
    model = @collection.get(element.data('id'))
    console.log model
    if  model.get('favourite')== true
      model.save favourite: false
      @collection.remove(model)
      #$('.favourite').addClass('favouritee')
    else
      model.save favourite: true
    @collection.trigger('reset')
  #search:(e) ->
   # console.log("jhvjvbjhvj")
   # e.preventDefault();
    #e.stopPropagation();
    #Bookmarksystem.d.navigate('#search', {trigger: true});
  #favour:(e) ->
   # console.log("jhvjvbjhvj")
    #e.preventDefault();
    #e.stopPropagation();
    #Bookmarksystem.d.navigate('#favour', {trigger: true}); 
  #home:(e) ->
   # console.log("jhvjvbjhvj")
    #e.preventDefault();
    #e.stopPropagation();
    #Bookmarksystem.d.navigate('', {trigger: true});
    