def _one_way_equal?(str1, str2)
  if str1.length == str2.length
    # possible one replacement away
    diffs = 0
    str1.each_char.with_index do |char, index|
      diffs += 1 if str2[index] != char
      return false if diffs > 1
    end
    return true if diffs == 1
  end

  false
end

def _one_way_length_diff_one?(longer, shorter)
  if shorter.length == longer.length - 1
    missing_char_pos = longer.each_char.to_a.index { |c| !shorter.include?(c) }
    s = shorter.insert(missing_char_pos, 'a')
    return true if s == shorter
  end

  false
end

def _one_way_sorted?(longer, shorter)
  return true if _one_way_equal?(longer, shorter)

  return true if _one_way_length_diff_one?(longer, shorter)

  false
end

def one_way?(str1, str2)
  return false if str1 == str2

  _one_way_sorted?(*([str1, str2].sort { |a, b| b.length <=> a.length }))
end
