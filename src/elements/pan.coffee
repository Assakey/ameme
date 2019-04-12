mathjs = require 'mathjs'

class Pan extends PIXI.Graphics
    constructor: (w, h, color) ->
        super()
        @x = mathjs.randomInt(0, window.innerWidth)
        @y = 300
        @vuelta = false
        @build()

        


    build:=>
        @beginFill(0xffffff)
        @drawRect(0, 0, 50, 50)
        @endFill()

    animate:=>
        return if @pause
        @y += 15




module.exports = Pan