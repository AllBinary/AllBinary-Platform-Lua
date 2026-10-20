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
-- package org.allbinary.game.displayable.canvas

local PointFactory = require("org.allbinary.graphics.PointFactory")
local Rectangle = require("org.allbinary.graphics.Rectangle")
local DisplayInfoSingleton = require("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local FormUtil = {}
FormUtil.__index = FormUtil
FormUtil.className = "FormUtil"

function FormUtil.new()
    local self = setmetatable({}, FormUtil)
    return self
end


function FormUtil.getInstance()
        return FormUtil.instance
end


function FormUtil:createFormRectangle()
        local displayInfo = DisplayInfoSingleton.getInstance()
        local pointFactory = PointFactory.getInstance()
        local rectangle = Rectangle.new(pointFactory:createXY(30, 10), displayInfo:getLastWidth() - 30, displayInfo:getLastHeight() - 35)
        return rectangle
end

FormUtil.instance = FormUtil.new()

return FormUtil

