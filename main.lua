function love.load()
  sprites = {}
  sprites.background = love.graphics.newImage('sprites/background.png')
  sprites.player = love.graphics.newImage('sprites/player.png')
  sprites.bullet = love.graphics.newImage('sprites/bullet.png')
  sprites.zombie = love.graphics.newImage('sprites/zombie.png')

  player = {}

  player.x = love.graphics.getWidth() / 2
  player.y = love.graphics.getHeight() / 2
  player.speed = 120 

  zombies = {}
  
  bullets = {}

end

function love.update(dt)
  if love.keyboard.isDown("d") then
     player.x = player.x + player.speed*dt
  end
  if love.keyboard.isDown("a") then
    player.x = player.x - player.speed*dt
  end
  if love.keyboard.isDown("s") then
    player.y = player.y + player.speed*dt
  end
  if love.keyboard.isDown("w") then
    player.y = player.y - player.speed*dt
  end

  for i,z in ipairs(zombies) do 
    z.x = z.x + (math.cos(zombiePlayerAngle(z)) * z.speed * dt)
    z.y = z.y + (math.sin(zombiePlayerAngle(z)) * z.speed * dt)
    if distanceBetween(z.x, z.y, player.x, player.y) < 10 then
      for i, z in ipairs(zombies) do
          zombies[i] = nil
      end
    end
  end

  for i,b in ipairs(bullets) do
    b.x = b.x + (math.cos(b.direction) * b.speed * dt)
    b.y = b .y + (math.sin(b.direction) * b.speed * dt)
  end
end

function love.draw()
  love.graphics.draw(sprites.background, 0, 0)
  love.graphics.draw(sprites.player, player.x, player.y, playerMouseAngle(), nil, nil, sprites.player:getWidth()/2, sprites.player:getHeight()/2)
  
  for i, z in ipairs(zombies) do
    love.graphics.draw(sprites.zombie, z.x, z.y, zombiePlayerAngle(z), nil, nil, sprites.zombie:getWidth()/2, sprites.zombie:getHeight()/2)   
  end

  for i,b in ipairs(bullets) do
    love.graphics.draw(sprites.bullet, b.x, b.y)  
  end
end

function love.keypressed( key )
  if key == "space" then
    spawnZombie()
  end
end

function love.mousepressed(x, y, button)
  if button == 1 then
    shootGun()
  end
end

function playerMouseAngle( )
  return math.atan2(player.y - love.mouse.getY(), player.x - love.mouse.getX()) + math.pi
end
function zombiePlayerAngle(enemy)
return math.atan2(player.y - enemy.y, player.x - enemy.x)
end

function spawnZombie()
  local zombie = {}
  zombie.x = math.random(0, love.graphics.getWidth())
  zombie.y = math.random(0, love.graphics.getHeight())
  zombie.speed = 120

  table.insert(zombies, zombie)
end

function shootGun()
  local bullet = {}
  bullet.x = player.x
  bullet.y = player.y
  bullet.speed = 500
  bullet.direction = playerMouseAngle()

  table.insert(bullets, bullet)
end

function distanceBetween(x1, y1, x2, y2)
  return math.sqrt((x2 - x1)^2 + (y2-y1)^2)
end