class ExitBeforeBrexit < Sinatra::Base

  get '/' do
    "Hello World"
    erb :"users/new"
  end

  post '/user/new' do
    @user = User.create(name: params[:name],
                        email: params[:email],
                        password: params[:password])
  end

end
