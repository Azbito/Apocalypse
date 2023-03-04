
function spawnZombie()  
  zombie = {}

  zombie.x = 0
  zombie.y = 0
  zombie.speed = 120
  zombie.dead = false
  
  side = math.random(1, 4)
  if side == 1 then 
    zombie.x = -30
    zombie.y = math.random(0, love.graphics.getHeight())
  elseif side == 2 then 
    zombie.x = love.graphics.getWidth() + 30
    zombie.y = math.random(0, love.graphics.getHeight())
  elseif side == 3 then 
    zombie.x = math.random(0, love.graphics.getWidth())
    zombie.y = -30
  elseif side == 4 then
    zombie.x = math.random(0, love.graphics.getWidth())
    zombie.y = love.graphics.getHeight() + 30
  end

  table.insert(zombies, zombie)
end
