class ExitBeforeBrexit < Sinatra::Base

  post '/requests/new' do
    if current_user
      current_user.requests.create(date_from: params[:reservation_arrival_date],
                                  manor: Manor.first(params[:manor_id]))
    else
      flash.next[:notice] = 'You must be logged in to request a manor'
      redirect('/sessions/new')
    end
  end

end
