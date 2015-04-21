--
-- Author: Jacky Woo
-- Date: 2015-04-20 23:58:09
--
local Hero = import( "../views/Hero" )

local GameScene = class( "GameScene", function()
	return display.newScene( "GameScene" )
end )

function GameScene:ctor()
	
end

function GameScene:onEnter( ... )
	self._hero = Hero.new():pos( display.cx, display.cy ):addTo( self ):scale( 5 )
end

function GameScene:onExit( ... )
	-- body
end

return GameScene