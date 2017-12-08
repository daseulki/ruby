
#1 폴더로 진입

Dir.chdir("test")

#2 디렉토리 안에 있는 전체 내용을 확인
# 파일명 변경

files = Dir.entries(Dir.pwd).reject {|i| i[0] == '.'}
files.each do |name|

  File.rename(name,name.gsub("new","new_"))
#gsub(찾을 문자, 바꿀 문자)
end
