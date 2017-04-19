class ExitBeforeBrexit < Sinatra::Base

  get '/' do
    "Hello World"
    erb :"users/new", :_test => false
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
      erb :'users/new'
    end
  end

end
