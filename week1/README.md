### 처음 github에 올릴때

1. 해당 폴더에서 git을 사용 하겠다. (git bash 에서 해당 폴더로 이동) =>로컬 저장소
  `git init`

2. 해당 폴더 내에 있는 모든 파일(.)들의 변경 사항을 기록하겠다.
  `git add .`

3. 지금 까지 변경 사항을 저장하겠다.
  `git commit -m "commit message"`

4. 내가 사용할 원격 저장소를 추가한다.
  `git remote add origin "https://github.com/daseulki/ruby.git"`

5. 원격 저장소에 보내겠다.
  `git push origin master`


### 파일을 수정한 후에 올릴 때

1. 해당 폴더 내에 있는 모든 파일의 변경 사항을 기록하겠다.
  `git add .`

2. 지금 까지 변경 사항을 저장하겠다.
  `git commit -m "commit message"`

3. 내가 사용할 원격 저장소를 추가한다.
  `git remote add origin "https://github.com/daseulki/ruby.git"`

4. 원격 저장소에 보내겠다.
  `git push origin master`





----



## 네이버 주식 정보 크롤링 

* 실습코드

``` ruby
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
```

