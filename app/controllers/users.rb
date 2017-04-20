class ExitBeforeBrexit < Sinatra::Base

  get '/' do
    @current_page = '/users/new'
    erb :"users/new"
  end

  post '/user/new' do
    @user = User.new(name: params[:name],
                        email: params[:email],
                        password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      redirect '/manors'
    else
      @current_page = '/users/new'
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

end
