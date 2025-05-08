class PostsController < ApplicationController
    


    def create
        #Find User
        #Create post with User
       if post = @user.posts.create(post_params)
            render json: post.as_json
       else
        render json: { message: "Post was not created", errors: post.errors.full_messages }
       end
    end


    private
    def post_params
        params.require(:post).permit(:caption,:image_url,:body)
    end
end