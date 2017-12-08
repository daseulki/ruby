#1.text 폴더로 들어간다.

Dir.chdir("test")

#2. 파일을 만든다.

#open->블럭 입력하기 ,new->파일 만들기

20.times do |i| #정해진 숫자를 돌릴때 인자를 넘겨준다 0부터 시작
  i +=1
# #{ ... }  = +"..."+
  File.open("newfile#{i}.txt","w+") do |file|
    file.write("hello world")
  end
end
