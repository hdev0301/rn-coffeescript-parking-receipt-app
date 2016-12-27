gulp = require 'gulp'
coffee = require 'gulp-coffee'
watch = require 'gulp-watch'
plumber = require 'gulp-plumber'
sourcemaps = require 'gulp-sourcemaps'
replace = require 'gulp-replace'
iconfont = require 'gulp-iconfont'
rimraf = require 'gulp-rimraf'
file = require 'gulp-file'
async = require 'async'
syncy = require 'syncy'


gulp.task 'sync', ->
  syncy [
    'src/**/*'
    '!src/res/icons/**'
    '!src/**/*.coffee'
  ], 'app/',
    ignoreInDest: [
      '**/extra-icons-config.json'
      '**/*.js'
    ]
    base: 'src'


gulp.task 'clean-js', ->
  gulp.src [
    'app/**/*.js'
    '!app/libs/ImageCarousell.js'
    '!app/screens/promo/list/card/*.js'
  ]
    .pipe rimraf()


gulp.task 'coffee', ['clean-js'], ->
  gulp.src('src/**/*.coffee')
    .pipe plumber()
    .pipe sourcemaps.init()
    .pipe replace(/'src\//g, "'bawadi-client/app/")
    .pipe coffee(bare: true)
    .pipe sourcemaps.write()
    .pipe gulp.dest('app/')


gulp.task 'compile-icons', (cb) ->
  stream = gulp.src('src/res/icons/**/*.svg')
    .pipe plumber()
    .pipe iconfont
      fontName: 'ExtraIcons'
      formats: ['ttf']

  async.parallel [
    (done) -> stream.on 'glyphs', (glyphs) ->
      setGlyph = (glyphMap, icon) ->
        glyphMap[icon.name] = icon.unicode[0]
        return glyphMap

      glyphs = glyphs.reduce(setGlyph, {})
      config = JSON.stringify(glyphs)
      file('extra-icons-config.json', config, src: yes)
        .pipe gulp.dest('app/res/')
        .on('finish', done)

    (done) ->
      stream
        .pipe gulp.dest('android/app/src/main/assets/fonts/')
        .pipe gulp.dest('ios/bawadi/')
        .on('finish', done)
  ], cb


gulp.task 'watch', ->
  watch ['src/**/*.coffee', '*.coffee', '!gulpfile.coffee'], ->
    gulp.start('coffee')

  watch ['src/res/icons/**/*.svg'], ->
    gulp.start('compile-icons')

  watch ['src/**/*', '!*.coffee', '!src/res/icons/**/*.svg'], ->
    gulp.start('sync')


gulp.task 'build', ['coffee', 'compile-icons', 'sync']


gulp.task 'default', [
  'build'
  'watch'
]
