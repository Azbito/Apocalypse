function shootGun()
  bullet = {}
  bullet.x = player.x
  bullet.y = player.y
  bullet.speed = 500
  bullet.dead = false
  bullet.direction = playerMouseAngle()
  table.insert(bullets, bullet)
end