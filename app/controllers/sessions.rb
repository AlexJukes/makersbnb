class ExitBeforeBrexit < Sinatra::Base

  get '/sessions/new' do
    @current_page = '/sessions/new'
    erb :"sessions/new"
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/manors'
    else
      @current_page = '/sessions/new'
      flash.now[:errors] = ['The email or password is incorrect']
      erb :"/sessions/new"
    end
  end

  delete '/sessions/end' do
    flash.next[:notice] = "Goodbye"
    session[:user_id] = nil
    redirect '/sessions/new'
  end

end
