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
-- package org.allbinary.canvas

local AppletUtil = require("org.allbinary.AppletUtil")
local J2MEUtil = require("org.allbinary.J2MEUtil")
local GameCommandsFactory = require("org.allbinary.game.commands.GameCommandsFactory")
local MyCanvas = require("org.allbinary.graphics.displayable.MyCanvas")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CustomGameMenuUtil = {}
CustomGameMenuUtil.__index = CustomGameMenuUtil
CustomGameMenuUtil.className = "CustomGameMenuUtil"

function CustomGameMenuUtil.new()
    local self = setmetatable({}, CustomGameMenuUtil)
    return self
end


function CustomGameMenuUtil.add(canvas)
        local gameCommandsFactory = GameCommandsFactory.getInstance()
        if AppletUtil.isAppletLoader(canvas) then
        elseif J2MEUtil.isHTML() then
        else
            canvas:addCommand(gameCommandsFactory.EXIT_COMMAND)
        end
end

return CustomGameMenuUtil

