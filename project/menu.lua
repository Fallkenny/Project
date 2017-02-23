require("player")
menu= {}

function menu.load()
	options= {
				"Start",
				"Help",
				"Options",
				"Quit"
			}
	currentOption = 1
	menu.x = 500
	menu.y = 200
	background =  love.graphics.newImage("img/sc.png")
	font = love.graphics.newFont( "Triforce.ttf", 50 )
	love.graphics.setFont(font);
	optionSelected = false
	menu.ativo=true
end

function love.keypressed(key)
   if key == "up" then
      currentOption = currentOption-1
	end
	if key == "down" then
		currentOption = currentOption+1
	end
	if key== "return" then	
		optionSelected = true
	end
	
end


function menu.update(dt)
	love.keypressed()
	if currentOption==5 then
		currentOption=1
	end
	
	if currentOption==0 then
		currentOption=4
	end
	
	if optionSelected == true then
		optionSelected =false
		if currentOption == 1 then 
			menu.ativo =false
			player.load()
		end
 		if currentOption == 4 then
			love.event.quit()
		end
	end
	
	
end

function menu.draw()
		sw= love.graphics.getWidth()
		sh= love.graphics.getHeight()
		love.graphics.setColor(255,255,255,255)
		love.graphics.draw(background,0, 0, 0, (sw/1280), (sh/720), 0, 0, 0, 0)

	if menu.ativo==true then
		
		itemy= menu.y
		for i,v in pairs (options) do
			love.graphics.setColor(0, 0, 0)
			if i==currentOption then
				love.graphics.setColor(255, 0, 0)
			end
			love.graphics.print(options[i], menu.x, itemy)
			itemy= itemy+70
		end
	end
end