require 'ruby2d'

backgroundmusic = Sound.new('backgroundmusic.mp3')
backgroundmusic.play
backgroundmusic.loop = true



level1_finish = false
level_not_pressed = true


if level_not_pressed 

    set title: 'Main'

    set width: 800
    set height: 600
    set background: Image.new('background.png',
    width: Window.width,
    height: Window.height,
    )

    def level1_hit?(level1, circle)
        level1.contains?(circle.x, circle.y)
    end
    def level2_hit?(level2, circle)
        level2.contains?(circle.x, circle.y)
    end
    def level3_hit?(level3, circle)
        level3.contains?(circle.x, circle.y)
    end

    level1 = Square.new( x: 55, y: 280, color: 'green', size: 55)
    level2 = Square.new( x: 140, y: 280, color: 'red', size: 55, z: 200)
    level3 = Square.new( x: 230, y: 280, color: 'red', size: 55, z: 200)

    levels = Image.new('Levels.png', width: Window.width, height: 400, x: 0, y: 150)


    on :mouse_up do |event|
        case event.button
        when :left
            if level_not_pressed == true
            circle = Circle.new(x: event.x, y: event.y, radius: 10,)
            end
            if circle && level1_hit?(level1, circle)

                level_not_pressed = false
                level1.x = -400
                level2.x = -400
                level3.x = -400
                update do

                    require 'C:\Users\eirik.haugennilsson\Desktop\Tillämpad_Programering\Projekt2_TP_Eirik_Nilsson\Levels\Level1.rb'
                end
            end
        end
    end
end

show

