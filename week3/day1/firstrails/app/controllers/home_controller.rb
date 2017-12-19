class HomeController < ApplicationController
  def index
  end
  def lotto
    @lotto = (1..45).to_a.sample(6).sort

  end
  def welcome
    @name = params[:name]
  end
  def square
    @num = params[:num]

  end
  def lunch
    @menu = ["20층","이자까야","김밥카페"].sample
  end
  def google
    @q = params[:q]
  end
  def vote

  end
  def result
    @vote = params[:vote]
  end
  def lunchimg
    @lunch = ["없어","밥 없어","공기"].sample
    @img_url = {
        "없어" =>"http://cfile1.uf.tistory.com/image/2041714E50EE665F0D9593",
        "밥 없어" =>"http://cfile1.uf.tistory.com/image/2041714E50EE665F0D9593",
        "공기" =>"http://cfile1.uf.tistory.com/image/2041714E50EE665F0D9593"
      }
  end
  def game1
    @user = params[:user]
    @play = ["은(는) 짱이다","은(는) 최고다","은(는) 멋지다","은(는) 슈퍼짱이다","은(는) 킹왕짱이다"].sample
  end
  def game2
  end
end
