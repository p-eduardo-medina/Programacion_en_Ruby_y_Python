def can_find(bigrams, words)
  h = Hash[]
  bigrams.each {|gram| h[gram]=0}
  bigrams.each do |gram|
    words.each do |word|
      if word.include?(gram)
        h[gram]+=1
      end
    end
  end
return !(h.values.include?(0))
end

#  p can_find(["at", "be", "th", "au"], ["beautiful", "the", "hat"])

def sock_pairs(socks)
  v = 0
  h = Hash[]
  socks.each_char {|gram| h[gram]=0}
  socks.each_char {|gram| h[gram]+=1}
  h.values.each {|element| (element/2>=1)?(v+=element/2):(v+=0)}
  return v
end
# p sock_pairs("CABBACCC")

def fib_str(n, str)
  arr = []
	if n<2
    p "Invalid input, n is equal or gratter yhat 2"
    return arr
  else
    s1 = str[0]
    s2 = str[1]
    s3 = ""
    arr << s1
    arr << s2
    (n-2).times do |index|
      s3 = s2 + s1
      arr <<(s3)
      s1 = s2
      s2 = s3
    end
  end
  return arr
end

# p fib_str(6, ["n", "k"])

def closest_palindrome(num)
  num2 = 0
  num3=num
  x=1
  if !(num.to_s==(num.to_s).reverse)
    while(!(num3.to_s==(num3.to_s).reverse))
      num3 = num-x
      ((num3.to_s==(num3.to_s).reverse))?(num2 = num3):(num3 = num+x)
      (!(num3.to_s==(num3.to_s).reverse))?(num2 = num3):()
      x+=1
    end
    return num3
  else
    num2 = num
  end
  return  num2
end

 # p closest_palindrome(1582289)

 def wiggle_string(str)
   s=str.upcase()
	(2*str.length+1).times do |index|
    if index <= str.length
      s = ' '+ s
      p s
    else
      s[0] = ''
      p s
    end
  end
end

# wiggle_string("Susana Gonzalez Marquez")

def initialize_names(names)
  abrev=[]
	names = names.map {|name| name.split}
  names.each {|name| s=""
    (name.length).times {|index| s+=(name[index][0]+".")}
    abrev << s
  }
  return abrev
end
# p initialize_names(["Pedro Eduardo Medina Gonzalez","Adrian Medina Gonzalez","Edna Susana Medina Gonzalez","Pedro Agustin Medina Sanchez","Susana Gonzalez Marquez"])

def digital_vowel_ban(n1, ban)
	h = {0=>"zero",1=>"one",2=>"two",3=>"three",4=>"four",5=>"five",6=>"six",7=>"seven",8=>"eight",9=>"nine"}
  n = n1.to_s
  h.each do |k,v|
    if v.include?(ban)
      n = n.tr(k.to_s, '')
    end
  end
  if (n=="")
    return "Banned Number"
  else
    return n.to_i
  end
end

#p digital_vowel_ban(14266330, "e")
#p digital_vowel_ban(586, "i")

def is_powerful(num)
  primes=[]
  (2..(num)).each do |pp|
    isprime=true
    (2..pp).each do |n|
      if pp%n==0
        isprime=false
      end
      if isprime and !primes.include?(pp)
        primes << pp
      end
    end
  end
  primes.unshift(2)
  primes.each do |pp|
    isprime = true
    (2..(pp-1)).each do |n|
      if pp%n==0
        isprime = false
      end
      (!isprime)?(primes.delete(pp)):()
    end
  end

  primes.delete_if {|pp| num%pp !=0 }

  return primes
end

#p is_powerful(210)

def sum_missing_numbers(arr)
  mx = arr.max
  mn = arr.min
  sum=0
  (mn..mx).each {|element| (arr.include?(element))?():(sum+=element)}
  return sum
end

# p sum_missing_numbers([4, 3, 8, 1, 2])# ??? 18

def swap_xy(s)
  sxy = []
  st = ""
	s.each_char do |char|
    if char == "("
      st = ""
    elsif char == ")"
      st = st.reverse
      st="("+st
      st+=")"
      sxy << st
    else
      st += char
    end
  end
  return sxy.join(",")
end
#p swap_xy("(1, 2), (3, 4), (3, 5), (9, 3)")# ??? "(2 ,1),(4 ,3),(5,3),(3,9)"
def longest_run(arr)
  arry = []
	(arr.length-1).times {|i| arry << (arr[i]-arr[i+1]).abs}
  sum = [0]
  arry.each {|element|(element!=1)?(sum << 1):(sum[sum.length-1]+=1)}
  return sum.max
end

# p longest_run([1, 2, 3, 5, 6, 7, 8, 9,10,11,13,14,16,17,18,19,20,21,22,23])# ??? 8
def letter_distance(str_1, str_2)
  arr = []
	(str_1.length<str_2.length)?(arr = str_1.chars):(arr = str_2.chars)
  arr = arr.map {|element| ((str_1[arr.index(element)]).ord - (str_2[arr.index(element)]).ord ).abs }
  return arr.reduce(0) { |sum, num| sum + num } + (str_1.length- str_2.length).abs
end
#p letter_distance("house", "fly")
#p letter_distance("abcde", "Abcde") #??? 32

def numtochar(num)
  alpbet=("a".."z").to_a
  r = 0
  s=""
  q = num.to_i
  loop do
    (q,r = (q-1).divmod(26))
    s.prepend(alpbet[r])
    break if q.zero?
  end
  return s
end

def decrypt(str)
  arr = ['']
  v = 0
  str.each_char do |char|
    if char == '#'
      arr.append('')
      v+=1
      next
    end
    arr[v]+=char
  end
  (arr[arr.length-1]=='')?(arr.pop):()
  arr1 = arr.map do |element|
    element = numtochar(element)
  end
  if str[str.length-1] != '#'
    s = (arr[arr.length-1].split(//)).map { |e| e = numtochar(e)  }
    arr1.pop()
    arr1+=s
  end
  return arr1.join()
end

#p decrypt("10#11#12")# ??? "jkab"
#p decrypt("1326#") #??? "axz"
#p decrypt("25#") #??? "y"

def crearcaja(num,str1,str2)
  arr = Array.new(num) { Array.new(num, 0) }
  num.times do |i|
    num.times do |j|
      (i == 0 or j == 0 or i==(num-1) or j==(num-1))?(v= str1):(v = str2)
      arr[i][j] = v
    end
  end
  return arr
end
#crearcaja(4,"$","A").each {|row| p row}

def sum_of_holes(num)
  has = {0=>1, 4=>1, 6=>1, 8=>2, 9=>1 }
  sum = 0
  num.times { |i|
    i+=1
    (i.to_s).each_char{|char| [has.keys.include?(char.to_i)?(sum += has[char.to_i]):()] }
  }
  return sum
end
# p sum_of_holes(14)# ??? 7
# p sum_of_holes(4)# ??? 1
# p sum_of_holes(6259)# ??? 12345






def matrix_mult(m1, m2)
  m = Array.new(m1.length) { Array.new(m1.length, 0) }
	(m1.length).times{ |i|
  m1.length.times{ |j|
    m1.length.times{|k| m[i][j]+= m1[i][k]*m2[k][j] }
     }
  }
  return m
end

#matrix_mult([[7, 5, 1],[2, 2, 2],[7, 5, 3]], [[2, 0, 0], [0, 2, 0],[0,0,2]]).each{|e| p e} # ??? [[57, 59], [18, 18]]

def quartic_equation(a, b, c)
	# ax^4 + bx^2 +c
  return 2*Math.sqrt( (-b + Math.sqrt(b*b-4*a*c) )/(2*a) )
end

#p quartic_equation(1, -5, 4) #??? 4
#p quartic_equation(4, 3, -1) #??? 2

def is_prim_pyth_triple(arr)
  suma = 0
  bln = 1
	arr.each{ |v| (v != arr.max)?(suma+= v**2):(suma+=0) }
  ((arr.max)**2 == suma)?(bln *= 1):(bln*=0)
  pp=[]
  if !bln.zero?
    arr.each{ |x|
    x.times{ |i|
      #p [i+1,x,(x % (i+1) ==0 and (i+1)!=x )]
      (x % (i+1) ==0 and (i+1)!=x )?(pp << (i+1)):() } }
    pp.delete_if{ |variable| variable==1  }
    pp.each{ |element| (pp.count(element)>1 )?(bln*=0):(bln*=1)}
    (bln.zero?)?(return false):(return true)
  else
    return false
  end

end

#p is_prim_pyth_triple([4, 5, 3])# ??? rue
#p is_prim_pyth_triple([7, 12, 13])# ??? false
#p is_prim_pyth_triple([39, 15, 36])# ??? false


def is_heteromecic(n)
  bln = false
	(n+1).times{ |i| ( i*(i+1)==n )?(bln = true):() }
  return bln
end
#p is_heteromecic(110)# ??? true

#p is_heteromecic(136)# ??? false

#p is_heteromecic(156) #??? true

def express_factors(n)
  pn = Hash[]
  while n%2==0
    (pn.keys.include?(2))?(pn[2]+=1):(pn[2]=1)
    n/=2
  end
  f=3
  while f*f<=n
    if n%f==0
      (pn.keys.include?(f))?(pn[f]+=1):(pn[f]=1)
      n/=f
    else
      f+=2
    end
  end
  if n != 1
    (pn.keys.include?(n))?(pn[n]+=1):(pn[n]=1)
  end
  s = "El numero es el producto de: "
  pn.each { |k,v| s+= (k.to_s+"^"+v.to_s+"*")}
  return [s[0..(s.length-2)],pn]
end
#p express_factors(100)

def firstprimenum(n)
  pp = []
  i=0
  while pp.length < n
   i+=1
   ((express_factors(i)[1]).keys.length == 1 and (express_factors(i)[1]).values[0]==1 )?(pp << express_factors(i)[1].keys[0] ):()
  end
 return pp
end

#p firstprimenum(5)


def factorial(n)
  r = 1
  (n==1)?(return r):(r *= (n*factorial(n-1)))
end
def kempner(n)
  bln = true
  i=1
	while bln
    if factorial(i)%n >0
      i+=1
    else
      bln=false
    end
  end
  return i
end

def itosis(i,s)
  arr = []
  while i>0
    arr << i%s
    i = i.divmod(s)[0]
  end
  return arr.reverse
end

#p kempner(6)

def gauss(num)
  (num.length < 2)?(num << 0):()
	return ((num[0]*(num[0]+1)/2) - (num[1]*(num[1]+1)/2) ).abs
end

#p gauss([100])

def number_to_tittle(s)
	alb = ('A'..'Z').to_a
  arr = []
  while s > 0
    s, r = s.divmod(26)
    arr << r
  end
  (!s.zero?)?(arr << s):()
  arr = arr.reverse
  return arr.map { |e| e = alb[e-1] }
end
#number_to_tittle(12346)

def title_to_number(s)
	alb = ('A'..'Z').to_a
  arr = []
  s.each_char {|c| c=c.upcase()
   arr << alb.index(c)+1}
  sum=0
  arr = arr.reverse
  (arr.length).times {|i| sum += arr[i]*26**i}
  return sum
end
# p title_to_number("A")# ??? 1
# p title_to_number("R") #??? 18
p title_to_number("BCG") #??? 28








# :P
