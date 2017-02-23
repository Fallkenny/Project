require ("menu")
game={}
function game.load()
	menu.load()
	music= love.audio.newSource("audio/musica.wav")
	love.audio.play(music)
end

function game.update(dt)
	menu.update(dt)
	if menu.ativo== false then
		player.update(dt)
	end
end

function game.draw()
	menu.draw()
	if menu.ativo== false then
		player.draw()
	end
	
end