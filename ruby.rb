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
    存在しなければnill
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

=begin
  横のビンゴ判定
    ”横の最初の数が1”かつ”横が全て重複”していたらビンゴ。これを行数分繰り返す。
  IN
    bingoJudgeCard
  OUT
    ビンゴならtrue。ハズレはfalse
=end
def bingo_row(bingoJudgeCard)
  bingoJudgeCard.each do |column|
    if column[0] == 1 && column.uniq.size == 1 then
      return true
    end
  end
  return false
end

=begin
  縦のビンゴ判定
    横のビンゴ判定を再利用するため、縦横を置換。その後、横判定を利用
  IN
    bingoJudgeCard
  OUT
    ビンゴならtrue。ハズレはfalse
=end
def bingo_column(bingoJudgeCard)
  replace_bingoJudgeCard = Array.new(S).map{Array.new(S,0) }
  bingoJudgeCard.each_with_index do |column,i|
    column.each_with_index do |value,j|
      replace_bingoJudgeCard[j][i] = value
    end
  end
  p replace_bingoJudgeCard
  replace_bingoJudgeCard.each do |column|
    if column[0] == 1 && column.uniq.size == 1 then
      return true
    end
  end
  return false
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
bingoJudgeCard = Array.new(S).map{Array.new(S,0) }

# ワードが存在すれば1,そうでなければ0
selected_row.each do |selected|
  position = find_position(bingoCard, selected)
  bingoJudgeCard[position[0]][position[1]] = 1;
end

p bingoJudgeCard

isRow = bingo_row(bingoJudgeCard)
isColumn = bingo_column(bingoJudgeCard)

puts isRow
puts isColumn


