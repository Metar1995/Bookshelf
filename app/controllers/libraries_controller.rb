class LibrariesController < ApplicationController
  def index
    @library = Library.all
  end

  def create
    library = Library.new
    library.assign_attributes(library_params)
    library.save
    @message = "Library Saved Successfully" and @status = "Success" and render "/success.json.jbuilder"
  end


  private

  def library_params
    params.permit(:name)
  end
end
