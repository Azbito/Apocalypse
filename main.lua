require('scripts/mouseCommands')
require('gameFront')
require('scripts/player/shoot')
require('scripts/player')
require('scripts/player/mouse')
require('scripts/zombie/spawn')
require('inGame')
require('scripts/gameInfo')
require('conf')
require('sprites')

function love.load()
  math.randomseed(os.time())
  zombies = {}
  bullets = {}
end

function love.update(dt)
  inGame(dt)
end

function love.draw()
 gameFront()
end

mouseClick()

playerMouseAngle()

function zombiePlayerAngle(enemy)
  return math.atan2(player.y - enemy.y, player.x - enemy.x)
  end

function distanceBetween(x1, y1, x2, y2)
  return math.sqrt((x2 - x1)^2 + (y2-y1)^2)
end