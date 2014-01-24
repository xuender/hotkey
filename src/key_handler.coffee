###
keyhook.coffee
Copyright (C) 2014 ender xu <xuender@gmail.com>

Distributed under terms of the MIT license.
###
KEY_NAME = ['ctrlKey', 'altKey', 'metaKey', 'shiftKey']
class KeyHandler
  this.keys = []
  this.bind = (key, callback)->
    if KeyHandler.keys.length == 0 and document
      document.addEventListener("keyup",(e)->
        for k in KeyHandler.keys
          if k.keyCode == e.keyCode
            b = true
            for n in KEY_NAME
              if k[n] != e[n]
                b = false
            if b
              k.callback()
      ,false)
    for k in key.split(' ')
      this.keys.push(new KeyHandler(k, callback))
  constructor: (@key, @callback) ->
    ks = key.toUpperCase().split('+')
    @keyCode = ks.pop().charCodeAt(0)
    @ctrlKey = false
    @altKey = false
    @metaKey = false
    @shiftKey = false
    for k in ks
      @ctrlKey = k.indexOf('CTR') >= 0 || @ctrlKey
      @altKey = k.indexOf('ALT') >= 0 || @altKey
      @metaKey = k.indexOf('MET') >= 0 || @metaKey
      @shiftKey = k.indexOf('SHI') >= 0 || @shiftKey
