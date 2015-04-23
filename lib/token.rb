class Token
  def initialize(char)
    @char = char
  end

  def operator?
    !/[+\-*\/^%=(),]/.match(@char).nil?
  end
end
