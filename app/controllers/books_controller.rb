class BooksController < ApplicationController
 
def bookers
 
end

  def index
   @book = Book.new
   @books = Book.all
  end
  
  def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    if @book.save
    # 4. トップ画面へリダイレクト
    flash[:notice] = "Book was successfully created."
    redirect_to book_path(@book.id)
    else 
      @books = Book.all
      render :index
      
    end

  end

  def update
    @book=Book.find(params[:id])
    
   if @book.update(book_params)
    flash[:notice] = "Book was successfully updated."
    redirect_to book_path(@book.id)
   else 
    render "edit"
   end
  end


  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id]) 
   
  end

  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to '/books'  # 投稿一覧画面へリダイレクト
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
