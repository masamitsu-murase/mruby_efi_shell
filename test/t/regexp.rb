##
# Regexp ISO Test

if Object.const_defined?(:Regexp)
  assert('Regexp', '15.2.15.1') do
    Regexp.class == Class and
    Regexp.superclass == Object
  end

  assert('Regexp.compile', '15.2.15.6.1') do
    re = Regexp.new('abc')
    re.class == Regexp
  end

  assert('Regexp.escape', '15.2.15.6.2') do
    # simply test
    re1 = Regexp.escape("$bc^")
    # PENDING: \n \t \r \f 0x20
    #re2 = Regexp.escape("0x0a 0x09 0x0d 0x0c 0x20")
    # '#' '$' '(' ')' '*' '+' '-'
    re3 = Regexp.escape("#$()*+-")
    # '.' '?' '[' ']' '^' '{' '|' '}'
    re4 = Regexp.escape(".?[]^{|}")
    # '\'
    re5 = Regexp.escape('\\')

    re1 == '\$bc\^' and
    # re2 == "\n\t\r\f" + "\ 0x20" and
    re3 == '\#\$\(\)\*\+\-' and
    re4 == '\.\?\[\]\^\{\|\}' and
    re5 == '\\\\'
  end

  assert('Regexp.last_match', '15.2.15.6.3') do
    re = Regexp.compile("(.)(.)")
    re.match("ab")

    Regexp.last_match.class == MatchData and
    Regexp.last_match[0] == "ab" and
    Regexp.last_match[1] == "a" and
    Regexp.last_match[2] == "b" and
    Regexp.last_match[3] == nil
  end

  assert('Regexp.quote', '15.2.15.6.4') do
    # simply test
    re1 = Regexp.quote("$bc^")
    # PENDING: \n \t \r \f 0x20
    #re2 = Regexp.escape("0x0a 0x09 0x0d 0x0c 0x20")
 
    # '#' '$' '(' ')' '*' '+' '-'
    re3 = Regexp.quote("#$()*+-")
    # '.' '?' '[' ']' '^' '{' '|' '}'
    re4 = Regexp.quote(".?[]^{|}")
    # '\'
    re5 = Regexp.quote('\\')

    # re2 == "\n\t\r\f" + "\ 0x20" and

    re1 == '\$bc\^' and
    re3 == '\#\$\(\)\*\+\-' and
    re4 == '\.\?\[\]\^\{\|\}' and
    re5 == '\\\\'
  end

  assert('Regexp#==', '15.2.15.7.1') do
    a = Regexp.compile("abcd")
    b = Regexp.compile("abcd")
    c = Regexp.compile("c")

    (a == b) == true and
    (a == c) == false and
    (b == c) == false
  end

  assert('Regexp#===', '15.2.15.7.2') do
    a = "HELLO"
    b = "hello"
    re = Regexp.compile("^[A-Z]*$")

    (re === a) == true and
    (re === b) == false
  end

  assert('Regexp#=~', '15.2.15.7.3') do
    re = Regexp.compile("foo")
    (re =~ "foo") == 0 and
    (re =~ "afoo") == 1 and
    (re =~ "bar") == nil
  end

  assert('Regexp#casefold?', '15.2.15.7.4') do
    a = Regexp.compile("foobar", Regexp::IGNORECASE)
    b = Regexp.compile("hogehoge")

    a.casefold? == true and
    b.casefold? == false
  end

  #assert('Regexp#initialize', '15.2.15.7.5') do
  #end

  #assert('Regexp#initialize_copy', '15.2.15.7.6') do
  #end

  assert('Regexp#match', '15.2.15.7.7') do
    re = Regexp.compile("(.)(.)")
    m = re.match("afoo")

    m.class == MatchData and
    m.to_s == "af" and
    m[1] == "a" and
    m[2] == "f"
  end

  #assert('Regexp#source', '15.2.15.7.8') do
  #end
end