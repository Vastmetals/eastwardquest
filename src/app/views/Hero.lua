--
-- Author: Jacky Woo
-- Date: 2015-04-21 00:13:56
--
local Hero = class( "Hero", function()
	return display.newSprite()
end )

function Hero:ctor( ... )
	-- body
end

function Hero:onEnter( ... )
	-- 预加载所有动画并缓存
end

function Hero:onExit( ... )
	-- body
end

function Hero:attackOnce( ... )
	local frames = display.newFrames( "images/hero/atk%d.png", 1, 4 )
	local animation = display.newAnimation( frames, 0.2 / 4 )
	self:playAnimationOnce( animation, false, function() end )
end

function Hero:attacking( ... )
	-- body
end

function Hero:run( ... )
	-- body
end

return Hero