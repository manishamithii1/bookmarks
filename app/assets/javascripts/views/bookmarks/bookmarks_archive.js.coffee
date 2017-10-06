class Bookmarksystem.Views.BookmarksArchive extends Backbone.View

  
  template: JST['bookmarks/archive']

  initialize: ->
    @collection.on('reset', @render, @)

  render: ->
    $(@el).html(@template(bookmarks: @collection))
    @ 

  #search:(e) ->
   # console.log("jhvjvbjhvj")
    #e.preventDefault();
   # e.stopPropagation();
   # Bookmarksystem.d.navigate('#search', {trigger: true}); 
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
    