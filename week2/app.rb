#localhost:4567

require 'sinatra'

#/ --> root page
get '/' do

  send_file 'index.html'

end

get '/welcome' do
  send_file 'welcome.html'

end

get '/five' do
  erb :hello
end

# /: --> 뒤에 들어오는 문자를 파라미터로 받겠다.

get '/welcome/:name' do

  @name = params[:name]
  erb :welcome

end


get '/lotto' do

  @lotto = (1..45).to_a.sample(6)
  erb :lotto

end

get '/square/:num' do

  @num = params[:num]
  erb :square

end


get '/search' do

  erb :search

end

get '/qresult' do

  @q = params[:q]
  @name = params[:name]
  erb :qresult

end
