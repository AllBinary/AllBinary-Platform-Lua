--
-- AllBinary Open License Version 1
-- Copyright (c) 2011 AllBinary
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

local GameLayerUtil = {}
package.loaded["org.allbinary.game.layer.GameLayerUtil"] = GameLayerUtil

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

local DisplayInfoSingleton = java_lazy("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local AllBinaryLayer = java_lazy("org.allbinary.layer.AllBinaryLayer")
local ViewPositionBase = java_lazy("org.allbinary.view.ViewPositionBase")

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

-- class table GameLayerUtil is declared before the requires
GameLayerUtil.__index = GameLayerUtil
GameLayerUtil.className = "GameLayerUtil"
GameLayerUtil.javaClassName = "org.allbinary.game.layer.GameLayerUtil"


function GameLayerUtil._jinit(self)
    return self
end

function GameLayerUtil.new(...)
    local self = setmetatable({}, GameLayerUtil)
    GameLayerUtil._jinit(self, ...)
    return self
end


function GameLayerUtil.isOnScreen(layer)
        local displayInfo = DisplayInfoSingleton.getInstance()
        local viewPosition = layer:getViewPosition()
        return GameLayerUtil.isInside(viewPosition:getX(), viewPosition:getY(), viewPosition:getX2(), viewPosition:getY2(), 0, 0, displayInfo:getLastWidth(), displayInfo:getLastHeight())
end


function GameLayerUtil.isInside(rectX1, rectY1, rectX2, rectY2, rect2X1, rect2Y1, rect2X2, rect2Y2)
        if rectX1 > rect2X1 and rectX2 < rect2X2 and rectY1 > rect2Y1 and rectY2 < rect2Y2 then
            return true
        else
            return false
        end
end

return GameLayerUtil

