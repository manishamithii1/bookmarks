class BookmarksController < ApplicationController
 respond_to :json
  
  def index
    respond_with Bookmark.all
  end
  
  def show
    respond_with Bookmark.find(params[:id])
  end
  
  def create
    respond_with Bookmark.create(new_params)
  end
  
  def update
	@element = Bookmark.find(params[:id])
    respond_with @element.update(update_params) 
   end
  
  def destroy
	@e= Bookmark.find(params[:id])
    respond_with @e.destroy() 
  end

  def archive
    archive= Bookmark.where('archive = ?',true)
    respond_with archive
  end
  def favourite
    favourite= Bookmark.where('favourite = ?',true)
    respond_with favourite
  end

  private

  def new_params
      params.require(:bookmark).permit(:title, :urlname,:favourite,:archive)
    end

  def update_params
      params.require(:bookmark).permit(:title, :urlname,:favourite,:archive)
    end

end
