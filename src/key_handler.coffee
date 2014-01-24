###
keyhook.coffee
Copyright (C) 2014 ender xu <xuender@gmail.com>

Distributed under terms of the MIT license.
###
_KEY_NAME = ['ctrlKey', 'altKey', 'metaKey', 'shiftKey']
class KeyHandler
  this.keys = []
  this.bind = (key, callback)->
    if KeyHandler.keys.length == 0 and document
      document.addEventListener("keyup",(e)->
        for k in KeyHandler.keys
          if k.keyCode == e.keyCode
            b = true
            for n in _KEY_NAME
              if k[n] != e[n]
                b = false
            if b
              k.callback()
      ,false)
    for k in key.split(' ')
      this.keys.push(new KeyHandler(k, callback))
  constructor: (@key, @callback) ->
    ks = @key.toUpperCase().split('+')
    c = ks.pop()
    if c.length == 1
      @keyCode = c.charCodeAt(0)
    if c.length == 2 # F1 = 112 = 49+63
      @keyCode = c.charCodeAt(1) + 63
    @ctrlKey = false
    @altKey = false
    @metaKey = false
    @shiftKey = false
    for k in ks
      @ctrlKey = k.indexOf('CTR') >= 0 || @ctrlKey
      @altKey = k.indexOf('ALT') >= 0 || @altKey
      @metaKey = k.indexOf('MET') >= 0 || @metaKey
      @shiftKey = k.indexOf('SHI') >= 0 || @shiftKey
