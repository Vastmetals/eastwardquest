--
-- Author: Jacky Woo
-- Date: 2015-04-20 23:58:09
--
local Hero = import( "..views.Hero" )
local Map = import( "..views.Map" )

local GameScene = class( "GameScene", function()
	return display.newScene( "GameScene" )
end )

function GameScene:ctor( level )
	self._level = level or 1
end

function GameScene:onEnter( ... )
	self._hero = Hero.new():pos( display.cx, display.cy ):addTo( self ):scale( 5 )

	self._map = Map.new( {} ):addTo( self )

	self:performWithDelay(function()
		self._layer = display.newLayer():addTo( self )
		self._layer:setKeypadEnabled( true )
		self._layer:addNodeEventListener( cc.KEYPAD_EVENT, function(event)
			printInfo("code = %s, key = %s", event.code, event.key)
		end )
	end, 0.5)
end

function GameScene:onExit( ... )
	-- body
end

return GameScene