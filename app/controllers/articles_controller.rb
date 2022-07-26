class ArticlesController < ApplicationController
    before_action :set_article, only: [:edit, :update, :show, :destroy]
    before_action :require_user, except: %i[index show search]
    def new
        @article = Article.new
    end

    def index

        # @articles = Article.paginate(page: params[:page], :per_page => 5)
        @articles= Article.page(params[:page]).per(6).order(id: :desc)    
    end

    def create
        @article = Article.new(article_params)
        @article.user = current_user
        respond_to do |format|
        if @article.save
            format.html { redirect_to article_path(@article), notice: "Atricle was successfully created." }  
          else
            format.html { render :new, status: :unprocessable_entity }
          end
        
        end

       
    end

    def update
        respond_to do |format|
        if @article.update(article_params)
            format.html { redirect_to article_path(@article), notice: "Atricle was successfully updated." }  
    
       else
        format.html { render :edit, status: :unprocessable_entity }
       end
    end
    end

    def show
         @comment = Comment.new
         @comment.article_id = @article.id
    end

    def search
        if params[:search].blank?
            redirect_to articles_path and return
        else
            @parameter = params[:search].downcase
            @articles= Article.where("lower(title) LIKE ?", "%#{@parameter}%")
            @user = User.all.where("lower(username) LIKE ?", "%#{@parameter}$")
         end

    end

    def destroy
        @article.destroy
        respond_to do |format|
            format.html { redirect_to articles_path, notice: "Article was successfully deleted.", status: :see_other}
        end
      end

    def edit
       
    end
    

    private
    def set_article
        @article = Article.find(params[:id])
    end
    def article_params
        params.require(:article).permit(:title, :descrption, :image, :user_id)
    end

end