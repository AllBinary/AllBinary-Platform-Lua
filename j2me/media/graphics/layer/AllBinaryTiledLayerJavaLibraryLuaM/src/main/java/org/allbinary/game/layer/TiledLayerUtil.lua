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

local TiledLayerUtil = {}
package.loaded["org.allbinary.game.layer.TiledLayerUtil"] = TiledLayerUtil

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local AllBinaryTiledLayer = java_lazy("org.allbinary.game.layer.AllBinaryTiledLayer")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table TiledLayerUtil is declared before the requires
TiledLayerUtil.__index = TiledLayerUtil
TiledLayerUtil.className = "TiledLayerUtil"
TiledLayerUtil.javaClassName = "org.allbinary.game.layer.TiledLayerUtil"

function TiledLayerUtil._jinit(self)
    return self
end

function TiledLayerUtil.new()
    return TiledLayerUtil._jinit(setmetatable({}, TiledLayerUtil))
end


function TiledLayerUtil.getInstance()
        return TiledLayerUtil.instance_f
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

TiledLayerUtil.instance_f = TiledLayerUtil.new()

return TiledLayerUtil

