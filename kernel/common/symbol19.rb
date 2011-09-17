class Symbol
  def capitalize
    to_s.capitalize.to_sym
  end

  def casecmp(other)
    to_s.casecmp(other.to_s)
  end

  def downcase
    to_s.downcase.to_sym
  end

  ##
  # Returns a pretty version of the symbol, fit for viewing
  #  :symbol.inspect #=> ":symbol"
  def inspect
    str = to_s

    case str
    when /^(\$|@@?)[a-z_][a-z_\d]*$/i,                      # Variable names
         /^[a-z_][a-z_\d]*[=?!]?$/i,                        # Method names
         /^\$(-[a-z_\d]|[+~:?<_\/'"$.,`!;\\=*>&@]|\d+)$/i,  # Special global variables
         /^([|^&\/%~`!]|!=|!~|<<|>>|<=>|===?|=~|[<>]=?|[+-]@?|\*\*?|\[\]=?)$/ # Operators
      ":#{str}"
    else
      ":#{str.inspect}"
    end
  end

  alias_method :intern, :to_sym
  alias_method :id2name, :to_s

  def swapcase
    to_s.swapcase.to_sym
  end

  def upcase
    to_s.upcase.to_sym
  end
end
