window.Bookmarksystem =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: -> 
    this.d = new Bookmarksystem.Routers.Bookmarks()
    Backbone.history.start()
    #Backbone.history.start({ pushState: true })

$(document).ready ->
  Bookmarksystem.init()
