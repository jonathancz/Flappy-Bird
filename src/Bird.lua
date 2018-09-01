--[[
	Bird Class
	
	The Bird is what we control in the game via clicking or the space bar; whenever we press either,
	the bird will flap and go up a littlbe bit, where it will then be affected by gravity. If the bird hits
	the ground or a pipe, the game is over.
]]
Bird = Class{}

local GRAVITY = 10

function Bird:init()
	-- load bird image from disk and assign its width and height
	self.image = love.graphics.newImage('bird.png')
	self.width = self.image:getWidth()
    self.height = self.image:getHeight()

	-- position bird in the middle of the screen
	self.x = VIRTUAL_WIDTH / 2 - (self.width / 2)
	self.y = VIRTUAL_HEIGHT / 2 - (self.height / 2)

	-- Y velocity; gravity
	self.dy = 0
end

function Bird:update(dt) 
	-- apply gravity to velocity
	self.dy = self.dy + GRAVITY * dt

	-- add a sudden burst of negative gravity if we hit space
	if love.keyboard.wasPressed('space') then
        self.dy = - 2.2
    end
	--apply current velocity to Y position
	self.y = self.y + self.dy
end

function Bird:render()
	love.graphics.draw(self.image, self.x, self.y)
end