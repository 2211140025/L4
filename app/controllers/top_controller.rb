class TopController < ApplicationController
    
    def index
        @users=User.all
    end
    
    def main 
        if session[:login_uid]
            render "main"
        else
            render "login"
        end
    end
    
    def login   
        if user=User.find_by(uid: params[:uid]) 
            login_password=BCrypt::Password.create(params[:pass])
            if BCrypt::Password.new(user.pass)==params[:pass]
                session[:login_uid] = params[:uid]
                redirect_to top_main_path
            else
                 render "error",status: 422
            end
        else
            render "error",status: 422
        end
    end
    
    def logout
        session.delete(:login_uid)
        redirect_to root_path
    end
end
