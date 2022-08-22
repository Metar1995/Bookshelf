class BooksController < ApplicationController
	before_action :find_account

  def create_books
    @books =  @library.books
    @books_library = @books.new(book_params)
    @books_library.save
    # if params[:image].present?
    #   binding.pry
    #   @books_library.album_photo.attach(params[:image])
    # end
    @message = "Book Created Successfully" and @status = "Success" and render "/success.json.jbuilder"
  end


  def update_book_attributes
    @book = @library.books.find_by(id: params[:book_id])
    @message = "Book Not Found" and @status = "Error" and render "/failure.json.jbuilder" and return if @book.blank?
    @book.update(book_params)
    @message = "Book Attributes Updated Successfully" and @status = "Success" and render "/success.json.jbuilder"
  end

  def show_books
    @books =  @library.books.all
    @message = "Book Not Found" and @status = "Error" and render "/success.json.jbuilder" and return if @books.blank?
  end

  def book_info
    @book = @library.books.find_by(id: params[:book_id])
    @message = "Book Not Found" and @status = "Error" and render "/failure.json.jbuilder" and return if @book.blank?
  end

  def delete_book
    @book = @library.books.find_by(id: params[:book_id])
    @message = "Book Not Found" and @status = "Error" and render "/failure.json.jbuilder" and return if @book.blank?
    @book&.destroy 
    @message = "Book Deleted Successfully" and @status = "Success" and render "/success.json.jbuilder"
  end

  def search_book
    @books = @library.books.where('name ILIKE :search', search: "%#{search_params[:query]}%")
    @message = "Book Not Found" and @status = "Error" and render "/success.json.jbuilder" and return if @books.blank?
  end

  private

  def search_params
    params.permit(:query)
  end


  def find_account
    @library = Library.find_by(id: params[:library_id])
    @message = "Library Not Found" and @status = "Error" and render "/failure.json.jbuilder" and return if @library.blank?
  end

  def book_params
    params.permit(:name,:info)
  end

end