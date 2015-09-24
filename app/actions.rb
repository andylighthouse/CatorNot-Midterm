# Homepage (Root path)

get '/' do
  erb :'index'
end

get "/signup" do
  erb :'users/signup'
end

get '/vote' do
  @question = Question.first
  erb :vote
end

get '/user/results' do
  erb :'user/results'
end

post 'signup' do
  @user = User.new(
    first_name: params[:first_name],
    last_name: params[:last_name],
    user_name: params[:username],
    email: params[:email],
    password: params[:password],
    password_confirmation: params[:password_confirmation],
    )
  # binding.pry
  if @user.save
    redirect '/'
  else
    redirect '/signup'
  end
end
