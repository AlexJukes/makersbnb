class ExitBeforeBrexit < Sinatra::Base

  get '/' do
    erb :"users/new", :layout => false
  end

  post '/user/new' do
    @user = User.new(name: params[:name],
                        email: params[:email],
                        password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      redirect '/manors'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :"users/new", :layout => false
    end
  end

end
