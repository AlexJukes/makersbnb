class ExitBeforeBrexit < Sinatra::Base

  get '/sessions/new' do
    erb :"sessions/new", :layout => false
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/manors'
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :"/sessions/new", :layout => false
    end
  end

  delete '/sessions/end' do
    flash.next[:notice] = "Goodbye"
    session[:user_id] = nil
    redirect '/sessions/new'
  end

end
