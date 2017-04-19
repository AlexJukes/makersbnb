class ExitBeforeBrexit < Sinatra::Base

  get '/manors/new' do
    erb :'manors/new'
  end

  post '/manor/new' do
    @manor = Manor.create(name: params[:name], description: params[:description], price: params[:price], date_from: params[:dateFrom], date_to: params[:dateTo])
  end
end
