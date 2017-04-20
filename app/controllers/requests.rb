class ExitBeforeBrexit < Sinatra::Base

  post '/requests/new' do
    current_user.requests.create(date_from: params[:reservation_arrival_date],
                                                  manor_id: params[:manor_id],)

  end
end
