class PizzaShop < Sinatra::Base

  get "/" do
    erb :"home"
  end

  get '/about' do
    erb :"about"
  end

  #get all pizzas ??? FIND OUT WHY
  get '/pizzas' do
    @pizzas = Pizza.all
    erb :"pizzas/index"
  end

  #new
  get '/pizzas/new' do
    @pizza = Pizza.new
    erb :"pizzas/new"
  end


  #create
  post "/pizzas" do
    @pizza = Pizza.new(params[:pizza])

    if @pizza.save
      redirect("/pizzas/#{@pizza.id}")
    else
      erb(:"pizzas/new")
    end
  end



  #show individual pizza
  get "/pizzas/:id" do
    @pizza = Pizza.find(params[:id])
    erb :"pizzas/show"
  end

  post "/pizzas/:id" do
    @pizza = Pizza.find(params[:id])
    erb :"pizzas/show"
  end

  #edit
  get '/pizzas/:id/edit' do
    @pizza = Pizza.find(params[:id])
    erb :"pizzas/edit"
  end

  #update
  put '/pizzas/:id' do
    @pizza = Pizza.find(params[:id])
    if @pizza.update_attributes(params[:id])
      redirect("/pizzas/#{@pizza.id}")
    else
      erb :"pizzas/edit"
    end
  end

  #delete
  delete '/pizzas/:id/delete' do
    @pizza = Pizza.find(params[:id])
    if @pizza.destroy
      redirect('/pizzas')
    else
      redirect("/pizzas/#{@pizza.id}")
    end
  end


end
