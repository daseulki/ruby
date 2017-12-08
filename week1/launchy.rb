
#브라우저 오픈과 관련된 잼을 불러온다
require 'launchy'
#==>true

#검색어 배열ㅇ르 만든다
idol = ["likelion","multicampus","sundo"]

#검색 url을 만든다
url = "https://search.naver.com/search.naver?query="

#반복한다

idol.each do |name|
  Launchy.open(url+name)
end
