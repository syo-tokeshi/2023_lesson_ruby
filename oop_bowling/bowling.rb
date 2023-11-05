require_relative 'game'

score = ARGV[0] # ボウリングのスコアは"6,3,9,0,0,3,8,2,7,3,X,9,1,8,0,X,6,4"のような文字列で渡ってくる。
game = Game.new(score) # 上記の文字列をGameクラスにサクッと渡しても良い感じにする(gameクラスは何を渡すべきか細かく知る必要はない)
p game.total_scores() # total_scoresメソッドでサクッとボウリングのスコアが出ることが理想なのでこうした
