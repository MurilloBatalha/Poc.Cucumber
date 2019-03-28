$count = 0
Before("@default") do
  @all_things = Hash.new(0)
end

Given("that I have {int} coins") do |coins|
  @total_coins = coins
end

Given("a {string} is {int} coins") do |thing, thing_price|
  @all_things[thing] = thing_price
end

When("I try to buy {int} {string}") do |qty, thing|
  total_amount = qty * @all_things[thing]
  @total_coins -= total_amount
end

Then("I should have {int} coin") do |balance|
  expect(@total_coins).to be(balance)
end

Given("a string {string}") do |text|
  @clear_text = text
  crypt = OpenSSL::PKey::RSA.generate(2048)
  puts crypt
end

When("I encrypt") do
  @encrypted_string = "mf2T/N4ZzMG40IUBimE5DzRMnCUV/ZtpZFEWmuRHiFM/Tf4e+6dPydThJJbGx6fxZtHSRRVVBHyj5EblAwCioKsw8NtlZV1DPw1dyFq5jf5G22thaBKciqL2j9r/KSUhWU/z9csPuHZkja4uQxDUuZvY5crQGgEfo01DRbMxPRiMYLqLJr0jXMwi4qgA3Sg58FNOlKvy0TQY0XuB9rOpgSj4l+BCxdE39ZG2WKcI6SxLOygbK4HXoZXQvVluztWU9GFOm5VUr7fSwTlQR74wQowXwVGzDWGyELklpgI9+zLfQR+yQ2Xxt1B6siV8RZ1xFRNFRbzzgZXC+UJgYFC+/A=="
end

Then("the decrypted string must be {string}") do |string|
  private_key = "-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEAm00XI3IriA80IJ03xA2oTX7SuSrA7Gd9BY1848gsgdz52hPK
dwnB+kO/6xXwfT/FJ+DLf6owWci1d7C3Mwh3Pf4HUthfLAzF/G7V2QKMO++1pNxi
vtjYRGGixKfKDOWaM3hLm3O/OSyzrkCmTLfIl4bfLwDXxD0g6sK0c80JHnmyDvV4
9SxfZ3QA1pnFfycDlzVDVjQVHIx6hAS4wno/GoV0PJecQwvO7K1Gk4XddvaeyoXp
i8lRUdKJQixUW7Pm9hu4Fmcr5dJtPTyteP2SeDn+u6LXy8nsSOJ9tyiQaP74Ik+r
7C1KQNdT54AOUgarez6LmUXeLr5tDCTRULLe5wIDAQABAoIBAAtpjtm7+hb1hw8e
foqZtlR7jWCuE59Lu5Q84YCbpSml43ZzHd3Bic+qSuArrJCHryVPD6VCDGuMpEk3
Yz8M0DZuBHvCCrxh8+qo+m4IEeYVp3OF/nun07yysBNjgSWRedNuc5/o0ZSSBGI5
vf7FQqhf8OazWSfCljiqNjiMSK9Eg/WO5K0g2cN+IQJmwpkJRvlfwrAT7nKW409K
POVbKHFiCe6aCloLRc3Y49YPQqHNBh54rpOJnis9TYShLyw904e+CK7Y+6kJXgkq
EkqgdSLYHPcSjMamRNasWL41ABbUJNohlg6CuewUqSxkgm58IO/P7EO5EaowqXCX
hDmcf4ECgYEA/heu9VlXeYw2wW0Q2jnFGqMIk+zohU0OWeN8AzZajRN+ODkmPfFo
3J79AwvxFNEZP6nndamXXP7e+YSF6tASrkBwcHBoRgy915yYqMJiggKOn9I+Fuqw
wg/toU/v8QyvU85O+f6KcWnS3ke26NMYBCXDNJKSnEEbUQtE5nsV1C0CgYEAnHeM
j7on4V9/WOYlJR2g2KdFjxnY0qc8U1QemYCjo8C68Ej4+OR5R7gR+0sH/VKIwFLc
sivAv1W+XXVtOg3qYGMWa4j9fSEbAzUMBVBmWJOVRJbrxzG72ZZyxAc8HXTAIyTi
ES3On+uBNBRtWusFpdlDamTScIhN3dmzb3PEh+MCgYEA0KM3yURL/IUybM8WmGn5
O68FGxnbr6EfGJYfPTADWHXaHWZnzVMNrKJr1HWYxmQPnGPxp37Sx8yL4Ex9/dpO
jIBjEyBprqNFuuZdv6ylYGWjIP5sdzrMWvzjPaK6va6RxHnSBZqJqSigul4ehbzX
qogral60PdOED572O150BR0CgYBYxxgxAL3aCXZXOZY/3fTCmP5FuLOmqo729Na7
4Bp5MkSfS7hAeFo8EDvbqnHpEShYf2uLiHm/1mXB33vPIdAnSnGRKFQz6FHMWw/r
//diMLLUDRHQnu5oAg4yHazFRdYy2p2Og8AmStivdRurJ4i31nOC7Zvdj+kmhHxk
M3qCYwKBgEn0XcqBWDnkyklWT1aMKCOY4KW7XfaPDBUvoEAgzSTBtPrL0vsoQAlF
VFjuqe6Uee9ozd20zkrM2mkTSF1B69Jq+7OJe2pVl8M3ebWfmwRyHCcw6S3MPo6i
zvNBPkSh6H1EarhlrinqH8N1C3g5glX0PSDbmf42TjJxIB8ZPyb5
-----END RSA PRIVATE KEY-----"
  #private_key = File.read("C:\\Git\\cucumber_poc\\private.pem")
  crypt = OpenSSL::PKey::RSA.new(private_key)

  decrypted = crypt.private_decrypt(Base64.decode64(@encrypted_string))

  expect(decrypted).to eq(@clear_text)
end
