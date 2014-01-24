hotkey
======

Provide hotkey functionality in AngularJS

## Getting Started
1. Include hotkey on your page

  ```html
  <script src="/path/to/hotkey.min.js"></script>
  ```
  
2. Put nghotkey to your module dependencies

  ```javascript
  var app = angular.module('app', ['hotkey']);
  ```
  
3. Set hotkey for elements or directives using hotkey directive as an attribute

  ```html
   <input type="text" hotkey="ctrl+I"></input>
    <input type="text" hotkey="F2"></input>
    <textarea hotkey="ctrl+shift+v"></textarea>
    <button hotkey="CTRL+M Meta+M" ng-click="run()">run</button>
  ```
## Note

If there is no ng-click attribute then focus, else execution ng-click.