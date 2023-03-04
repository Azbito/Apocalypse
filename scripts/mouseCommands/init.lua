function mouseClick()
  function love.mousepressed(x, y, button)
    if button == 1 and gameState == 2 then
      shootGun()
    elseif button == 1 and gameState == 1 then
      gameState = 2
      maxTime = 2
      timer = maxTime
    end
  end
end
