function gameFront()
  love.graphics.draw(sprites.background, 0, 0)

  if gameState == 1 then
    love.graphics.setFont(myFont)
    love.graphics.printf("Click anywhere to begin!", 0, 50, love.graphics.getWidth(), "center")
    score = 0
  end

  love.graphics.draw(sprites.player, player.x, player.y, playerMouseAngle(), nil, nil, sprites.player:getWidth()/2, sprites.player:getHeight()/2)
  
  for i, z in ipairs(zombies) do
    love.graphics.draw(sprites.zombie, z.x, z.y, zombiePlayerAngle(z), nil, nil, sprites.zombie:getWidth()/2, sprites.zombie:getHeight()/2)   
  end

  for i,b in ipairs(bullets) do
    love.graphics.draw(sprites.bullet, b.x, b.y, nil, .5, nil, sprites.bullet:getWidth()/2, sprites.bullet:getHeight()/2)  
  end
  love.graphics.printf("Score " .. score, 0, love.graphics.getHeight() - 100, love.graphics.getWidth(), "center")

  love.graphics.setColor(1, 1, 1)
  
  if player.injured then
    love.graphics.setColor(1, 0, 0)
  end
end