class Bookmarksystem.Views.Bookmark extends Backbone.View
  template: JST['bookmarks/bookmark']
  tagName: 'tr'

  events:
    "click .destroy" : "delete"
    'click .edit' : 'editbookmark'
    'click .archive' : 'addToarchive'
    'click .favourite' : 'addTofavourite'


    
  initialize: ->
    @model.on('remove',@renderremove, @)
    @model.on('change', @render, @)
  
  clear: ->
    @model.destroy();
    

  render: ->
    $(@el).html(@template(bookmark: @model))
    @

  renderremove: ->
    $(@el).remove()

  delete: ->
    @model.destroy(
      wait: true
    ) if confirm "Are you sure?"
    @  


  editbookmark: ->
    newName = prompt("Please enter the new name", @model.get('title'))
    newUrl = prompt("Please enter the new url", @model.get('urlname'))

    if (!newName)
      return;
    #if (newName == " " || newUrl == " ")
      #alert("please enter the title or url")
    else  
      @model.save(title: newName,urlname: newUrl)


  addToarchive: ->
    if  @model.get('archive')== true
      @model.save archive: false
      #$('.archive').addClass('archived')
    else
      @model.save archive: true

    
  append: (archive) ->
    view = new Bookmarksystem.Views.Archive(model: archive)
    #if @model.get('archive')== true
     # $(view.el).addClass('archived')
    $('#archives').prepend(view.render().el) 

  addTofavourite: ->
    console.log($('.favourite').text())
    if  @model.get('favourite')== true
      @model.save favourite: false
      #$('.favourite').addClass('favouritee')
    else
      @model.save favourite: true
      #$('.favourite').removeClass('favouritee')


   


 

