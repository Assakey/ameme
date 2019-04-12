class Cat extends PIXI.Sprite.fromImage
    constructor: (img) ->
        super(img)
        @height = 100
        @width = 70
        @x = 950
        @y = 900
        @alpha = 1


module.exports = Cat