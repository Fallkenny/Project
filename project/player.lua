player = {}

function player.load()
	player.width = 50
	player.height = 100
	player.x = 100
	player.y = 50
	player.speed= 600
	sheet = love.graphics.newImage('img/frames.png')
	currentFrame=1
	elapsed=0
    frameSideX = 50
	imageWidth = sheet:getWidth()
    imageHeight = sheet:getHeight()
    frames = {
                 love.graphics.newQuad(0, 0, 48, 93, imageWidth, imageHeight),
                 love.graphics.newQuad(frameSideX*1, 0, 48, 93, imageWidth, imageHeight),
                 love.graphics.newQuad(frameSideX*2, 0, 48, 93, imageWidth, imageHeight),
                 love.graphics.newQuad(frameSideX*3, 0, 48, 93, imageWidth, imageHeight),
                 love.graphics.newQuad(frameSideX*4, 0, 48, 93, imageWidth, imageHeight),
                 love.graphics.newQuad(frameSideX*5, 0, 48, 93, imageWidth, imageHeight)
             }
end

function player.update(dt)
	 elapsed = elapsed + dt
    if elapsed > 1 then
        elapsed = elapsed - 1
        if currentFrame == 6 then
            currentFrame = 1
        else
            currentFrame = currentFrame + 1
        end
    end
	if love.keyboard.isDown("left") then
		player.x= player.x - (player.speed * dt)
	elseif love.keyboard.isDown("right") then
		player.x= player.x + (player.speed * dt)
	elseif love.keyboard.isDown("up") then
		player.y= player.y - (player.speed * dt)
	elseif love.keyboard.isDown("down") then
		player.y= player.y + (player.speed * dt)
	end
end

function player.draw()
	love.graphics.draw(sheet, frames[currentFrame],player.x, player.y)
end