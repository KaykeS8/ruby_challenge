def caesar_cipher(text, displacement = 0)
  encrypted_text = text.split("").map do |letter_text|
    if letter_text.match(/[a-z]/)
       position = letter_text.ord + displacement
       position = (position - 122) + 96 until position < 123
       position.chr
    elsif letter_text.match(/[A-Z]/)  
      position = letter_text.ord + displacement
      position = (position - 90) + 64 until position < 91
      position.chr
    else position
    end
   end
   encrypted_text.join()
end
p caesar_cipher('cat', 3)

# ord vai de 97 à 122 sao letras minusculas[a-z], de 65 à 90 são letras maiusculas[A-Z]

