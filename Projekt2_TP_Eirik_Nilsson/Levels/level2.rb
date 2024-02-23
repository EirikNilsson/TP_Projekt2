
require 'ruby2d'


alive = true

boss_alive = true
boss_life = 55

shoot = Sound.new('shootingsound.mp3')


set title: 'Shooting Game'

set width: 800
set height: 600
set background: Image.new('background2.png',
width: Window.width,
height: Window.height,
)

cursor_aim = Image.new(
  'crosshair.png',
  x: -100,
  y: -100,
  z: 700,

  width: 1000,
  height: 700,
)

boss_health_text = Text.new(
  "",
  x: 350, y: 50,
  style: 'bold',
  size: 20,
  color: 'black',
  z: 10
  )


score_text = Text.new(
  "Score: 0",
  x: 350, y: 50,
  style: 'bold',
  size: 20,
  color: 'black',
  z: 10
)

start_text = Text.new(
  "Press 's' too start",
  x: 300,
  y: 100,
  style: 'bold',
  size: 30,
  color: 'black',
  z: 10
)






score = 0
boss_bounce_x = 700




start = false






position_max = 400
size_max1 = 600
size_max2 = 600
size_max3 = 600




def enemy_hit_circle1?(enemy1, circle)
  # Adjust the condition based on your game logic
  enemy1.contains?(circle.x, circle.y)
end

def enemy_hit_circle2?(enemy2, circle)
  # Adjust the condition based on your game logic
  enemy2.contains?(circle.x, circle.y)
end

def enemy_hit_circle3?(enemy3, circle)
  # Adjust the condition based on your game logic
  enemy3.contains?(circle.x, circle.y)
end

def boss_hit_circle?(boss, circle)
  boss.contains?(circle.x, circle.y)
  
end

def restart_hit?(restart, circle)
  restart.contains?(circle.x, circle.y)

end
def lobby_hit?(lobby, circle)
  lobby.contains?(circle.x, circle.y)

end





enemy1 = Image.new(
  'character2.png', 
  x: 200, # Adjust the initial x position
  y: 450,
  width: 10,
  height: 50,

)

enemy2 = Image.new(
  'character2.png', 
  x: 400, # Adjust the initial x position
  y: 450,
  width: 10,
  height: 50,

)
enemy3 = Image.new(
  'character2.png', 
  x: 600, # Adjust the initial x position
  y: 450,
  width: 10,
  height: 10,

)

boss = Image.new(
  'boss2.png',
  x: 700,
  y: 480,
  width: 0,
  height: 0,

)



on :key do |event|
  case event.key
  when 's'
    start = true
    start_text.text = ""
  end


end

circle = nil


on :mouse_down do |event|
  case event.button
  when :left
    
    

  end
end
on :mouse_up do |event|
  case event.button

  
  when :left

      circle = Circle.new(x: event.x, y: event.y, radius: 0)
      boom = Sprite.new('boom.png', x: event.x - 60, y: event.y - 60, clip_width: 127, time: 75)
      if circle && enemy_hit_circle1?(enemy1, circle) || circle && enemy_hit_circle2?(enemy2, circle) || circle && enemy_hit_circle3?(enemy3, circle) || circle && boss_hit_circle?(boss, circle)
        boom.play
        boss_life -= 1
        shoot.play
        
        

      end







  end
end





update do
  
  

  if start 
    enemy1.z += 1
    enemy2.z += 1
    enemy3.z += 1
    cursor_aim.x = Window.mouse_x - 500
    cursor_aim.y = Window.mouse_y - 350
  


    
    if alive 
      if score < 40

        

        if circle && enemy_hit_circle1?(enemy1, circle)
          circle.x = -200
          circle.y = -200
          enemy1.z = 0


          size_max1 = 600
          enemy1.width = 10
          enemy1.height = 10
          score += 1
          enemy1.x = rand(100..700)
          


        end
        
        




        if circle && enemy_hit_circle2?(enemy2, circle)
          circle.x = -200
          circle.y = -200
          enemy2.z = 0
          size_max2 = 600
          enemy2.width = 10
          enemy2.height = 10
          score += 1
          enemy2.x = rand(100..700)


            

          

        end
        if circle && enemy_hit_circle3?(enemy3, circle)
          circle.x = -200
          circle.y = -200
          size_max3 = 600
          enemy3.z = 0
          enemy3.width = 10
          enemy3.height = 10
          score += 1
          enemy3.x = rand(100..700)
        

        end
      
        
        if 0 < size_max1
          enemy1.width += 2
          enemy1.height += 2
          size_max1 -= 1
      
        end

        if 0 < size_max2
          enemy2.width += 2
          enemy2.height += 2
          size_max2 -= 1
      
        end

        if 0 < size_max3
          enemy3.width += 2
          enemy3.height += 2
          size_max3 -= 1
      
        end

        score_text.text = "Score: #{score}"

        if enemy1.width == 300 or enemy2.width == 300 or enemy3.width == 300
          alive = false
        end
      elsif score == 40 && score != 70
        enemy1.width = 0
        enemy1.height = 0
        enemy2.width = 0
        enemy2.height = 0
        enemy3.width = 0
        enemy3.height = 0
        boss_alive = true
        score_text.text = ""


        boss_health_text.text = "Boss life: #{boss_life}"


      







        if boss_alive 



          if boss.width > 300 

            boss.width = 0
            boss.height = 0
            alive = false
            boss_alive = false



            
    
          end

          boss.width += 0.7
          boss.height += 0.7
          if boss.x < boss_bounce_x 
            boss.x += 5
            

          elsif boss.x > boss_bounce_x 
            boss.x -= 5
          else
            boss_bounce_x = rand(20..140) * 5
            
          end
        end






        if boss_alive 
          
          if circle && boss_hit_circle?(boss, circle)
            circle.x = -200
            circle.y = -200


          end
          if boss_life == 0
            circle.x = -200
            circle.y = -200
            score_text.text = ""

            boss_alive = false 
            score = 70
           
            finishtext_text = Text.new(
            "Victory!!",
            x: 330, y: 130,
            style: 'bold',
            size: 40,
            color: 'blue',
            z: 10
            ) 
            restart = Rectangle.new(x: 225, y: 330, width: 350, height: 60, color: 'red')
            lobby = Rectangle.new(x: 180, y: 410, width: 440, height: 70, color: 'green')


            restart_lobby_button = Image.new(
              'Restart_and_lobby_button.png',
              x: -350,
              y: 40
            )
          

            on :mouse_up do |event|
              case event.button
              when :left
                
                circle = Circle.new(x: event.x, y: event.y, radius: 0,)
         
                if circle && restart_hit?(restart, circle)
                  restart.remove 
                  lobby.remove
                  restart_lobby_button.remove
                  finishtext_text.remove
                  start_text.text = "Press 's' too start"

               
                  boss.width = 0
                  boss.height = 0
                  alive = true
                  score = 0
                  size_max1 = 600
                  size_max2 = 600
                  size_max3 = 600
                  boss_life = 55
                  start = false
                  score_text.text = ""
                  boss_health_text.text = ""
                  enemy1.width = 0
                  enemy1.height = 0
                  enemy2.width = 0
                  enemy2.height = 0
                  enemy3.width = 0
                  enemy3.height = 0
                  boss_alive = false



                end
                if circle && lobby_hit?(lobby, circle)
                  lobby.remove
                  restart.remove
                  clear
                  

                  update do
                    require 'C:\Users\eirik.haugennilsson\Desktop\Tillämpad_Programering\Projekt2_TP_Eirik_Nilsson\Main_lobby\main3.rb'
                  end

              

                  
                  
                  


                end

              end
            end

  








          end




        end
      end

      

        
    elsif alive == false
      score_text.text = ""
      boss_health_text.text = ""

      enemy1.width = 0
      enemy1.height = 0
      enemy2.width = 0
      enemy2.height = 0
      enemy3.width = 0
      enemy3.height = 0

      loss_text = Text.new(
        "",
        x: 80, y: 50,
        size: 30,
        color: 'black',
        z: 10,
      )

      loss_text.text = "Game over, Your Score was #{score}. Press 'r' to restart. "
      if alive == false
        on :key_up do |event|
          case event.key
          when 'r'
            alive = true
            loss_text.text = ""
            score = 0
            size_max1 = 600
            size_max2 = 600
            size_max3 = 600
            boss_life = 55
            start = false
            start_text.text = "Press 's' to start"


          end

        end
      end


      
    end

  end
end
