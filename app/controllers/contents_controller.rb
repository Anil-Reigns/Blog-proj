class ContentsController < ApplicationController

    def home
        if params[:filter].nil?
            @all = Content.all
         
        else
            @all = Content.where(category: params[:filter])
        end
        @l_id = params[:param1]

    end
    def result
        @l_id = params[:param1]
        if params[:filter].strip != "" 
            @obj = Content.where("contents.title LIKE?", "%"+params[:filter]+"%")
        else
            @obj = []
        end
    end

    def filter
        redirect_to filter_path(filter: params[:filter], param1: params[:param1])
    end

    def new
        @allblogs = Content.new     # this line is not necessary in the html forms
        @l_id = params[:param1]
    end

    def create
        @l_id = params[:param1]
        @allblogs = Content.new(
            author: params[:contents][:author],
            title: params[:contents][:title],
            blog: params[:contents][:blog],
            references: params[:contents][:references],
            category: params[:contents][:category],
            blogid: @l_id
        )
        puts @allblogs

        if @allblogs.save
            redirect_to home_path(param1: @l_id)
        else
            render :new, status: :unprocessable_entity
        end
    end

    def delete
        @l_id = params[:param1]
        @blog = Content.find_by(id: params[:del])
        @blog.destroy
        redirect_to myblog_path(param1: @l_id)
        
    end

    def myblog
        @l_id = params[:param1]
        @my = Content.where(blogid: @l_id )
        @mylikes = Like.where(user_id: @l_id, ref_like: 1)
    end

    def info
        @l_id = params[:param1]
    end

    def about
        @l_id = params[:param1]
    end

    def show
        @l_id = params[:param1]
        @view = Content.find(params[:param2])
        @allcomm = Comment.where(c_id: params[:param2])
        @all_likes = Like.where(blogid: params[:param2], ref_like: 1)
    end


    def addcomment
        if params[:comm].strip != ""
            @obj = Comment.new(
                comm: params[:comm],
                blogid: params[:param1],
                c_id: params[:param2] 
            )
            @obj.save
            redirect_to show_path(param1: params[:param1], param2: params[:param2])

        else
            redirect_to show_path(param1: params[:param1], param2: params[:param2])
        end
    end

    def addlike
        @user_like = User.find(params[:param1])
        @like = Content.find(params[:param2])

        @like_obj = Like.find_by(blogid: params[:param2], user_id: params[:param1])
        
        if @like_obj.class == NilClass
            Like.create(blogid: params[:param2], user_id: params[:param1], ref_like: 1)
        elsif @like_obj.ref_like == 1
            @like_obj.update(ref_like: 0)
        else
            @like_obj.update(ref_like: 1)
        end


        redirect_to show_path(param1: params[:param1], param2: params[:param2])
    end

    def edit
        @l_id = params[:param1]
        @b = Content.find(params[:param2])
    end

    def update
        @l_id = params[:param1]
        @u_blog = Content.find(params[:param2])
        @u_blog.update(
            author: params[:contents][:author],
            title: params[:contents][:title],
            blog: params[:contents][:blog],
            references: params[:contents][:references],
            category: params[:contents][:category],
            blogid: @l_id
        )

        redirect_to myblog_path(param1: @l_id)
    end

    
    # Use callbacks to share common setup or constraints between actions.

    # private
    # def contents_params
    #     params.require(:contents).permit(:author, :title, :blog, :references, :blogid)
    # end


   
end