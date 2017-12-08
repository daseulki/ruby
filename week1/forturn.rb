require 'httparty'
require 'nokogiri'


url = "https://search.daum.net/search?w=tot&DA=YZR&t__nil_searchbox=btn&sug=&sugo=&q=%EB%B3%84%EC%9E%90%EB%A6%AC+%EC%9A%B4%EC%84%B8"
#url 요청
response = HTTParty.get(url)
#가져온 문서를 노코기리 형식으로 저장한다 -> 컴퓨터가 보기 쉽다
doc = Nokogiri::HTML(response)

#크롬 검사 -> 필요한 부분 copy selector 문서중에 가장 가져오기 편한 데이터 (ID)
fortune1 = doc.css("
#asterismResult > div > div.fortune_info > div > div:nth-child(1) > div > div.desc_result > p")

#xpath 로도 가능

#kospi에 저장된 것중 태그 안에 있는 텍스트를 출력
puts fortune1.text
