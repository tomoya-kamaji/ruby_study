=begin
  ビンゴカードを作る
  判定用ビンゴカードを作る
  入力する
  判定用ビンゴカードに1を入れる
=end

=begin
  ビンゴの位置を探す関数
  IN
    $bingoCard：ビンゴカード
    $selected：選ばれたワード
  OUT
    ビンゴが存在する位置(i,j)
    存在しなければnull
=end
def find_position(bingoCard, selected)
  bingoCard.each_with_index do |column,i|
    column.each_with_index do |value,j|
      if value == selected then
        puts "i:#{i} j:#{j} value:#{value}"
        return Array[i,j]
      end
    end
  end
  return nill;
end

S = 3;
N = 5;

bingoCard = [
  ['q', 'w', 'e'],
  ['a', 's', 'd'],
  ['z', 'x', 'c']
]
selected_row = ['q', 'w', 'e'];
selected_column = ['q', 'a', 'z'];
selected_naname = ['q', 's', 'c'];
selected_false = ['q', 'z', 't'];

# ビンゴの判定用のカード作成
bingoJudgeCard = Array.new(S, Array.new(S, "0") )
bingoJudgeCard = Array.new(S).map{Array.new(S,0) }


# 二次元配列で
selected_row.each do |selected|
  position = find_position(bingoCard, selected)
  
  bingoJudgeCard[position[0]][position[1]] = 1;
end

p bingoJudgeCard
