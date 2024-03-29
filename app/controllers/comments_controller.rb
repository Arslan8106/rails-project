class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]

  # GET /comments or /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1 or /comments/1.json
  def show

  end

  # GET /comments/new
  def new
    
    @comment = Comment.new

  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments or /comments.json
  def create
 

    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]
    @comment.user = current_user
    session[:article_id] = @comment.article_id 
    respond_to do |format|
      if @comment.save
        format.html {redirect_to article_path(@comment.article), notice: "Comment was successfully created." } 
      else
        # new_article_comment
        flash[:unprocessable_entity] = "Please fill all comment fields"
        format.html { redirect_to articles_path(@article), status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to comment_url(@comment), notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url, notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.


    def load_article!
      @article = Article.find_by!(id: comment_params[:article_id])
    end

    def comment_params
      params.require(:comment).permit(:description, :name)
    end
end
