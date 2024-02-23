

level1_finish = false
level_not_pressed = true

if level_not_pressed 

    set title: 'finish_main'

    set width: 800
    set height: 600
    set background: Image.new('background.png',
    width: Window.width,
    height: Window.height,
    )

    text = Text.new( "All available levels completed!!", x: 280, y: 30, color: 'green')



    level1 = Square.new( x: 55, y: 280, color: 'green', size: 55, z: 100)
    level2 = Square.new( x: 140, y: 280, color: 'green', size: 55, z: 100)
    level3 = Square.new( x: 230, y: 280, color: 'green', size: 55, z: 100)

    levels = Image.new('Levels.png', width: Window.width, height: 400, x: 0, y: 150)

end


