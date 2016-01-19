module.exports = 

  indexFormatter: (i, radix) ->
    ending = (i % radix).toString radix
    output = (i // radix)
    output + ending