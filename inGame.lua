function inGame(a)
  if gameState == 2 then
    local moveSpeed = player.speed
    if player.injured then
        moveSpeed = player.injuredSpeed
    end

      if love.keyboard.isDown("d") and player.x < love.graphics.getWidth() then
        player.x = player.x + moveSpeed*a
      end
      if love.keyboard.isDown("a") and player.x > 0 then
        player.x = player.x - moveSpeed*a
      end
      if love.keyboard.isDown("s") and player.y < love.graphics.getHeight() then
        player.y = player.y + moveSpeed*a
      end
      if love.keyboard.isDown("w") and player.y > 0 then
        player.y = player.y - moveSpeed*a
      end

      for i,z in ipairs(zombies) do 
        z.x = z.x + (math.cos(zombiePlayerAngle(z)) * z.speed * a)
        z.y = z.y + (math.sin(zombiePlayerAngle(z)) * z.speed * a)
        
        if distanceBetween(z.x, z.y, player.x, player.y) < 30 then
          if player.injured == false then
            player.injured = true
            z.dead = true
          else 
            for i, z in ipairs(zombies) do
              zombies[i] = nil
              gameState = 1
              player.injured = false
              player.x = love.graphics.getWidth()/2
              player.y = love.graphics.getHeight()/2
            end
          end
        end
      end

      for i,b in ipairs(bullets) do
        b.x = b.x + (math.cos(b.direction) * b.speed * a)
        b.y = b .y + (math.sin(b.direction) * b.speed * a)
      end

      for i=#bullets, 1, -1 do
        local b = bullets[i]
        if b.x < 0 or b.y < 0 or b.x > love.graphics.getWidth() or b.y > love.graphics.getHeight() then
          table.remove(bullets, i)
        end
      end

      for i,z in ipairs(zombies) do
        for j, b in ipairs(bullets) do
          if distanceBetween(z.x, z.y, b.x, b.y) < 20 then
            z.dead = true
            b.dead = true
            score = score + 1
          end
        end
      end

      for i=#zombies, 1, -1 do 
        local z = zombies[i]
        if z.dead == true then 
          table.remove(zombies, i)
        end
      end

      if gameState == 2 then 
        timer = timer - a
        if timer <= 0 then 
          spawnZombie()
          maxTime = 0.95 * maxTime
          timer = maxTime
        end 
      end
  end
end