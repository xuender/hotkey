###
hotkey.coffee
Copyright (C) 2014 ender xu <xuender@gmail.com>

Distributed under terms of the MIT license.
###

angular.module('hotkey', [])
  .factory('KeyHandler', ->
    {
      bind: (keys, callback)->
        KeyHandler.bind(keys, callback)
    }
  )
  .directive('hotkey',  ['KeyHandler', (handler)->
    {
      restrict: 'A'
      link: (scope, iElement, iAttrs)->
        if iAttrs.ngClick
          handler.bind(iAttrs.hotkey, ->
            scope.$apply(iAttrs.ngClick)
          )
        else
          handler.bind(iAttrs.hotkey, ->
            iElement[0].focus()
          )
    }
  ]).directive('enter', ->
    ($scope, elm, attr)->
      elm.bind('keydown', (e)->
        if e.keyCode == 13
          if attr.enter
            $scope.$apply(attr.enter)
          else
            e.preventDefault()
            nxtIdx = $('input,select,button').index(this) + 1
            $('input,select,button').eq(nxtIdx).focus()
      )
  ).directive('focus', ->
    ($scope, elm)->
      elm[0].focus()
  )
