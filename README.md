ng-hotkey
======

Provide hotkey functionality in AngularJS

## Getting Started

1. User Bower install hotkey.
  ```
  bower install ng-hotkey
  ```
1. Include hotkey on your page

  ```html
  <script src="/path/to/hotkey.min.js"></script>
  ```
1. Put nghotkey to your module dependencies

  ```javascript
  var app = angular.module('app', ['hotkey']);
  ```
1. Set hotkey for elements or directives using hotkey directive as an attribute

  ```html
    <input type="text" hotkey="ctrl+I"></input>
    <input type="text" hotkey="F2"></input>
    <textarea hotkey="ctrl+shift+v"></textarea>
    <button hotkey="CTRL+M Meta+M" ng-click="run()">run</button>
    <input type="text" enter="func()"></input>
  ```

## Note

If have ng-click attribute then execution ng-click else focus.
