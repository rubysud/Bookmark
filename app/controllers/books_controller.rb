class BooksController < ApplicationController

	def index
    Rails.logger.info "Books Path: #{books_path}\nBooks URL: #{books_url}\nBook Path: #{book_path(1)}\nBook URL: #{book_url(1)}\nEdit Book Path: #{edit_book_path(1)}\nEdit Book URL: #{edit_book_url(1)}}"
    @books = Book.all
   
	end

  def new
    @book = Book.new
  end

	def show
	  @book = Book.find(params[:id])
	  @reviews = @book.reviews
   end

   def create
    # @books= Book.all
    # @c=Book.all
    b = Book.new(params[:book])
    if b.save
      #redirect_to :action => :index
      flash[:alert] = "New Book Created"
      redirect_to :action=> 'index'  
      #success
    else
      flash[:alert] = "Book Creation Failed"
      redirect_to :action=> 'index'
      #failure
    end
    # b = Book.create(params[:book])

    # @book_new= Book.new(books_params) 
    #render 'books'
    
    # redirect_to books_path
    end

    def edit
      @book = Book.find(params[:id])

   end

    def update
      @book = Book.find(params[:id])
      if @book.update_attributes(params[:book])
         redirect_to :action => 'show' 
      else
         @reviews = Review.find(:all)
         render :action => 'edit'
      end
    end
    
    def new_comment
      @book = Book.find(params[:id])
      @comment =@book.comments.new
       
    end
    def create_comment
     @book = Book.find(params[:id])
     b =@book.comments.new(params[:comment])
     if b.save
        redirect_to :action => :comments
      else
        render :action => :new_comment
     #pending
    end
  end
    
    def comments
      @book = Book.find(params[:id])
      @comments = @book.comments
    end
    


    def destroy
     @book =Book.find(params[:id])
    
     if @book.destroy
      redirect_to action: 'index'
      flash[:success] = "Deleted!"
      
      else

      #render :json => {:success => 'true', :message => 'Book deleted!'}
     end
   end

     def delete_comment
      @book =Book.find(params[:id])
      @comments=@book.comments.destroy(params[:comment_id])
      # c= @comments.delete_comment(params[:comment_id])
      # if c.save
        redirect_to :action => :comments
      
      # end


    end

    # private 
    # def books_params
    # params.require(:book).permit(:title, :author, :image)
    # end

end
