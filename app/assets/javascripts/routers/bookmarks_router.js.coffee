class Bookmarksystem.Routers.Bookmarks extends Backbone.Router
  routes:
    '': 'index'
    "search": "archivesIndex"
    "favour": "favouritesIndex"
    
    
  index: ->
    @collection = new Bookmarksystem.Collections.Bookmarks()
    @collection.fetch
      wait: true
      reset: true
    console.log("hgb")
    view = new Bookmarksystem.Views.BookmarksIndex(collection: @collection)
    $('#container').html(view.render().el)
  
  archivesIndex: ->
    @collection = new Bookmarksystem.Collections.Bookmarks()
    @collection.fetch
      wait: true
      reset: true
      url: '/api/search'
    view = new Bookmarksystem.Views.BookmarksArchive(collection: @collection)
    $('#container').html(view.render().el)

  favouritesIndex: ->
    @collection = new Bookmarksystem.Collections.Bookmarks()
    @collection.fetch
      wait: true
      reset: true
      url: '/api/favour'
    view1 = new Bookmarksystem.Views.BookmarksFavourite(collection: @collection)
    $('#container').html(view1.render().el)
  
  
    