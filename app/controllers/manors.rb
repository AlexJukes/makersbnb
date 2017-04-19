class ExitBeforeBrexit < Sinatra::Base

  get '/manors' do
    erb :'manors/index'
  end

  get '/manors/new' do
    erb :'manors/new'
  end

  post '/manor/new' do
    Manor.create(name: params[:name], description: params[:description], price: params[:price], date_from: params[:dateFrom], date_to: params[:dateTo])
    redirect '/manors'
  end

  get '/manors' do
    @manors = Manor.all
    erb :'/manors/index'
  end
end
