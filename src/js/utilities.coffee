module.exports = 

  indexFormatter: (i, radix) ->
    ending = (i % radix).toString radix
    output = (i // radix)
    output + ending

  isCSV: (fn) ->
    '.csv' is fn.slice fn.length - 4

  getDir: (fn) ->
    i = fn.length - 1
    i-- until fn[i] is '/'
    fn.slice 0, i