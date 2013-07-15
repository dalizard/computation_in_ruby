module Pattern
  def bracket outer_precedence
    if precendence < outer_precedence
      '(' + to_s + ')'
    else
      to_s
    end
  end

  def inspect
    "/#{self}/"
  end
end

class Empty
  include Pattern

  def to_s
    ''
  end

  def precendence
    3
  end
end

class Literal < Struct.new :character
  include Pattern

  def to_s
    character
  end

  def precendence
    3
  end
end

class Concatenate < Struct.new :first, :second
  include Pattern

  def to_s
    [first, second].map { |pattern| pattern.bracket precendence }.join '|'
  end

  def precendence
    0
  end
end

class Repeat < Struct.new :pattern
  include Pattern

  def to_s
    pattern.bracket(precendence) + '*'
  end

  def precendence
    2
  end
end
