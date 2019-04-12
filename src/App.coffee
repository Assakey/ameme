Rect = require("./elements/Rect")
Stage = require("./data/stage")
Background = require("./elements/Background")
BgImage = require('./assets/backgroundforest.jpg')
Cat = require("./elements/cat")
Slender = require("./elements/slender")
CatImage = require('./assets/G.png')
slendy = require('./assets/slendy.jpg')
Pan = require("./elements/pan")
PanImage = require('./assets/pan.png')
sound = require 'Howler'

class App extends PIXI.Application
  animation:true
  animationNodes:[]
  myStage: Stage
  enemies:[]
  cat = null
  pan = null
  rightPressed: false
  leftPressed: false
  constructor:(w,h,o)->
    super(w,h,o)
    window.addEventListener 'keypress', @onKeyPress
    window.addEventListener 'keyup', @onKeyUp
    document.body.appendChild @view
    @preload()
    @animate()
    @scream()
    @direccion=1
    

  onKeyPress: (e) =>
    if e.key == "d"
      return if @cat.x > 1800
      @cat.x += 70 *@direccion
     

    if e.key == "a"
      return if @cat.x < 70
      @cat.x -= 70 * @direccion
      
      
      

  onKeyUp: (e) =>
    if e.key == "d"
      @direccion *= -1

    if e.key == "a"
      @direccion *= -1

  preload:=>
    PIXI.loader.add(BgImage).add(CatImage).add(PanImage).add(slendy).load(@build)
 

  build:=>
    bg = new Background(BgImage)
    @stage.addChild bg
    @cat = new Cat(CatImage)
    @stage.addChild @cat
    @buildpan()
    @heli = new Slender(slendy)
    @stage.addChild @heli
    @heli.x = 660
    @heli.y = 100
    @heli.alpha = 0

  scream:=>
    setTimeout =>
      clearInterval(@interval)
      @heli.alpha = 1
    , 15000





  buildpan:=>
    @interval = setInterval =>
      @pan = new Pan(0, 0, @color)
      @stage.addChild(@pan)
      @enemies.push(@pan)
      @addAnimationNodes(@pan)
      @y += 10 
    ,100
    
  matapan:(cat, arr)=>
    for n in arr
      if (cat.x < n.x + n.width &&  cat.x + cat.width > n.x &&  cat.y < n.y + n.height &&  cat.height + cat.y > n.y)
        cat.alpha = 0
        return true
    return false






  addAnimationNodes:(child)=>
    @animationNodes.push child
    null

  animate:=>
    @ticker.add ()=>
      @matapan(@cat, @enemies)
      for n in @animationNodes
        n.animate?()

    null

module.exports = App
