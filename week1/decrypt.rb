def strxor(a, b)
  if a.size == b.size
    a.each_with_index.inject([]) do |bytes, (a_elem, i)|
      b_elem = b.bytes[i]
      bytes[i] = a_elem ^ b_elem
      bytes
    end
  else
    a, b = [a, b].sort { |x| x.size } # a < b
    b.each_with_index.inject([]) do |bytes, (b_elem, i)|
      a_elem = a[i % a.size]
      bytes[i] = a_elem ^ b_elem
      bytes
    end
  end.pack('C*')
end

ciphertexts = File.read('ciphertexts.txt').split("\n")



