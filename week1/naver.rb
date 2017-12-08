require 'httparty'
require 'nokogiri'


url = "http://finance.naver.com/sise/"
#url 요청
response = HTTParty.get(url)
#가져온 문서를 노코기리 형식으로 저장한다 -> 컴퓨터가 보기 쉽다
doc = Nokogiri::HTML(response)

#크롬 검사 -> 필요한 부분 copy selector 문서중에 가장 가져오기 편한 데이터 (ID)
kospi = doc.css("#KOSPI_now")
#xpath 로도 가능

#kospi에 저장된 것중 태그 안에 있는 텍스트를 출력
puts kospi.text
