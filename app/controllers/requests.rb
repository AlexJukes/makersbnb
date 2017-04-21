class ExitBeforeBrexit < Sinatra::Base

  post '/requests/new' do
    if current_user
      current_user.requests.create(date_from: params[:reservation_arrival_date],
                                  manor: Manor.first(params[:manor_id]))
      require 'pry'; binding.pry
      redirect '/requests'
    else
      flash.next[:notice] = 'You must be logged in to request a manor'
      redirect('/sessions/new')
    end
  end


  get '/requests' do
    @user_requests = current_user.requests
    @received_requests = current_user.manors.requests
    erb :'requests/index'
  end

  get '/requests/:id' do
    # "Hello world"
    @request = Request.first(id: params[:id])
    erb :'requests/details'
  end

end
