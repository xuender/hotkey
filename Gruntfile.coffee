module.exports = (grunt)->
  grunt.loadNpmTasks('grunt-contrib-clean')
  grunt.loadNpmTasks('grunt-contrib-uglify')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-contrib-copy')
  grunt.loadNpmTasks('grunt-karma')
  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-coffeelint')
  grunt.loadNpmTasks('grunt-bumpx')

  grunt.initConfig(
    pkg:
      grunt.file.readJSON('package.json')
    clean:
      dist: ['dist', 'dist/hotkey.js', 'hotkey.min.js']
    bump:
      options:
        part: 'patch'
      files: [ 'package.json', 'bower.json']
    copy:
      angular:
        files: [
          cwd: 'bower_components/angular/'
          src: [
            'angular.min.js'
            'angular.min.js.map'
          ]
          dest: 'dist'
          expand: true
          filter: 'isFile'
        ]
      root:
        files: [
          cwd: 'src'
          src: [
            'demo.html'
          ]
          dest: 'dist'
          expand: true
          filter: 'isFile'
        ]
    coffee:
      options:
        bare: true
      main:
        files:
          'dist/hotkey.js': [
            'src/key_handler.coffee'
            'src/hotkey.coffee'
          ]
    uglify:
      main:
        files:
          'hotkey.min.js': [
            'dist/hotkey.js'
          ]
    watch:
      html:
        files: [
          'src/*.html'
        ]
        tasks: ['copy:root']
      coffee:
        files: [
          'src/*.coffee'
        ]
        tasks: ['coffee']
    karma:
      options:
        configFile: 'karma.conf.js'
      dev:
        colors: true,
      travis:
        singleRun: true
        autoWatch: false
  )
  grunt.registerTask('test', ['karma'])
  grunt.registerTask('dev', [
    'clean'
    'copy',
    'coffee'
  ])
  grunt.registerTask('dist', [
    'dev'
    'uglify'
  ])
  grunt.registerTask('deploy', [
    'bump'
    'dist'
  ])
  grunt.registerTask('travis', 'travis test', ['karma:travis'])
  grunt.registerTask('default', ['dist'])
