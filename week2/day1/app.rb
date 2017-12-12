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
get '/lunch' do
  @lunch = ["없어","밥 없어","공기"].sample
  @img_url = {
      "없어" =>"http://cfile1.uf.tistory.com/image/2041714E50EE665F0D9593",
      "밥 없어" =>"http://cfile1.uf.tistory.com/image/2041714E50EE665F0D9593",
      "공기" =>"http://cfile1.uf.tistory.com/image/2041714E50EE665F0D9593"
    }
  erb :lunch
end
get '/game' do

  erb :game

end

get '/gresult' do

  @modifier = ["장난아닌", "슈퍼파워","울트라","갓","킹","초특급","밀레니엄","캡숑","짱","캡틴","오지고지리고렛잇고"].to_a.sample
  @gname = params[:gname]
  erb :gresult

end
