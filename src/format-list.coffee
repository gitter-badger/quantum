insertAt = (src, index, str) ->
  src.substr(0, index) + str + src.substr(index)

module.exports = 
  
  NEM: (number) ->
    number = number.toString()
    insertAt(number, number.length-6, '.')
