# bingoJudgeCard = ['apple', 'orange', 'cube'];


selected = [];
S = 3;
N = 5;

# bingoCard[0] = ['apple', 'orange', 'cube'];
# bingoCard[1] = ['batch', 'web', 'cloud'];
# bingoCard[2] = ['sql', 'http', 'https'];


# ビンゴの判定用のカード作成
bingoJudgeCard = Array.new(S, Array.new(S, "0") )

for i in 1..S do
  for j in 1..S do
    # print(bingoJudgeCard[i][j]);
  end
end




print(bingoJudgeCard);
