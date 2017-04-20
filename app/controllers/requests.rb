class ExitBeforeBrexit < Sinatra::Base

  post '/requests/new' do
    current_user.requests.create(date_from: params[:reservation_arrival_date],
                   manor: Manor.first(params[:manor_id]))

  end

end
