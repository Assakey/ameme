class Rect extends PIXI.Graphics

    constructor: (x, y, width, height, color) ->
        super()
        @x = x
        @y = y
        @width = width
        @height = height
        @color = color
        @build()
        
    
    build: () =>
        @beginFill(@color)
        @drawRect(@x, @y, @width, @height)
        @endFill()

module.exports = Rect
