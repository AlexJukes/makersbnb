class ExitBeforeBrexit < Sinatra::Base

  post '/requests/new' do
    current_user.requests.create(date_from: params[:reservation_arrival_date],
                   manor: Manor.first(params[:manor_id]))

    redirect '/requests'
  end

  get '/requests' do
    @user_requests = current_user.requests
    @received_requests = current_user.manors.requests
    erb :'requests/index'
  end

end
