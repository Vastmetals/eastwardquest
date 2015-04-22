--
-- Author: Jacky Woo
-- Date: 2015-04-21 22:49:59
--
local Map = class( "Map", function()
	return display.newLayer()
end)

function Map:ctor( params )
	self._gridSize = params.gridSize or cc.size( 96, 96 )
	self._groundTile = params.groundTile or "images/image 223.png"

	self._col = math.ceil( display.width / self._gridSize.width )
	self._row = 3

	self:initGround()
end

function Map:initGround( ... )
	for r = 1, self._row do
		for c = 1, self._col do
			local x = (c-1) * self._gridSize.width
			local y = (r-1) * self._gridSize.height
			local tile = display.newSprite( self._groundTile, x, y ):addTo( self )
			tile:setAnchorPoint( cc.p( 0, 0 ) )
			local size = tile:getContentSize()
			local sx = self._gridSize.width / size.width
			local sy = self._gridSize.height / size.height
			tile:setScaleX( sx )
			tile:setScaleY( sy )
		end
	end
end

return Map