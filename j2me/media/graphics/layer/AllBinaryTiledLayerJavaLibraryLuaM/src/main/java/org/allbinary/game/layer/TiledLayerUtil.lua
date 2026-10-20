-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2006 AllBinary 
--  
-- By agreeing to this license you and any business entity you represent are 
-- legally bound to the AllBinary Open License Version 1 legal agreement. 
--  
-- You may obtain the AllBinary Open License Version 1 legal agreement from 
-- AllBinary or the root directory of AllBinary's AllBinary Platform repository. 
--  
-- Created By: Travis Berthelot 
--   
-- Generated Code Do Not Modify
-- package org.allbinary.game.layer


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TiledLayerUtil = {}
TiledLayerUtil.__index = TiledLayerUtil
TiledLayerUtil.className = "TiledLayerUtil"

function TiledLayerUtil.new()
    local self = setmetatable({}, TiledLayerUtil)
    return self
end


function TiledLayerUtil.getInstance()
        return TiledLayerUtil.instance
end


function TiledLayerUtil:keepOnBorderdMapX(terrainTiledLayer, x, width, mapBorderBufferWidth)
        local newX = x
        local maxRight = terrainTiledLayer:getWidth() - width - mapBorderBufferWidth
        if x + width > maxRight then
            newX = maxRight
        end
        if x < mapBorderBufferWidth then
            newX = mapBorderBufferWidth
        end
        return newX
end


function TiledLayerUtil:keepOnBorderdMapY(terrainTiledLayer, y, height, mapBorderBufferHeight)
        local newY = y
        local maxBottom = terrainTiledLayer:getHeight() - height - mapBorderBufferHeight
        if y + height > maxBottom then
            newY = maxBottom
        end
        if y < mapBorderBufferHeight then
            newY = mapBorderBufferHeight
        end
        return newY
end


function TiledLayerUtil:keepOnMapX(terrainTiledLayer, x, width)
        local newX = x
        local maxRight = terrainTiledLayer:getWidth() - width
        if x >= maxRight then
            newX = maxRight
        end
        if x < 0 then
            newX = 0
        end
        return newX
end


function TiledLayerUtil:keepOnMapY(terrainTiledLayer, y, height)
        local newY = y
        local maxBottom = terrainTiledLayer:getHeight() - height
        if y >= maxBottom then
            newY = maxBottom
        end
        if y < 0 then
            newY = 0
        end
        return newY
end

TiledLayerUtil.instance = TiledLayerUtil.new()

return TiledLayerUtil

