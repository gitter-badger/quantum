insertAt = (src, index, str) ->
  src.substr(0, index) + str + src.substr(index)

module.exports =

  XEM: (number) ->
    number = number.toString()
    insertAt(number, number.length-6, '.')

  NQT: (number) ->
    number.toString()

  XRP: (number) ->
    number.toString()
