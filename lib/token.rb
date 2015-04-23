class Token
  def initialize(char)
    raise 'Only one character is allowed' unless char.size == 1
    @char = char
  end

  def operator?
    !/[+\-*\/^%=(),]/.match(@char).nil?
  end

  def digit?
    !/[0-9]/.match(@char).nil?
  end

  def white_space?
    !/\s/.match(@char).nil?
  end

  def identifier?
    !(operator? || digit? || white_space?)
  end
end
