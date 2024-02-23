

level1_finish = false
level_not_pressed = true


if level_not_pressed 

    set title: 'Main2'

    set width: 800
    set height: 600
    set background: Image.new('background.png',
    width: Window.width,
    height: Window.height,
    )

    def level2_hit?(level2, circle)
        level2.contains?(circle.x, circle.y)
    end

    level1 = Square.new( x: 55, y: 280, color: 'green', size: 55, z: 100)
    level2 = Square.new( x: 140, y: 280, color: 'green', size: 55)
    level3 = Square.new( x: 230, y: 280, color: 'red', size: 55, z: 100)

    levels = Image.new('Levels.png', width: Window.width, height: 400, x: 0, y: 150)


    on :mouse_up do |event|
        case event.button
        when :left
            if level_not_pressed == true
            circle = Circle.new(x: event.x, y: event.y, radius: 10,)
            end
            if circle && level2_hit?(level2, circle)
                level_not_pressed = false
                level1.z = 0
                level1.x = -400
                level2.x = -400
                level3.x = -400
                

                update do 
                    
                
                   
                    require 'C:\Users\eirik.haugennilsson\Desktop\Tillämpad_Programering\Projekt2_TP_Eirik_Nilsson\Levels\Level2.rb'
                   
                    
                end

                
                
             
            

            end


        end
    end
end



