-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2022 AllBinary 
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
-- package org.allbinary

local GameCommandsFactory = require("org.allbinary.game.commands.GameCommandsFactory")
local MultiPlayerGameFeatureFactory = require("org.allbinary.game.configuration.feature.MultiPlayerGameFeatureFactory")
local MyCanvas = require("org.allbinary.graphics.displayable.MyCanvas")
local GenericOperatingSystem = require("org.allbinary.logic.system.os.GenericOperatingSystem")
local OperatingSystemFactory = require("org.allbinary.logic.system.os.OperatingSystemFactory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PostGameCommandFactory = {}
PostGameCommandFactory.__index = PostGameCommandFactory
PostGameCommandFactory.className = "PostGameCommandFactory"

function PostGameCommandFactory.new()
    local self = setmetatable({}, PostGameCommandFactory)
    return self
end


function PostGameCommandFactory.getInstance()
        return PostGameCommandFactory.instance
end


function PostGameCommandFactory:addCommands(canvas)
        local operatingSystemInterface = OperatingSystemFactory.getInstance():getOperatingSystemInstance()
        local gameCommandsFactory = GameCommandsFactory.getInstance()
        if not operatingSystemInterface:isOverScan() then
            canvas:addCommand(gameCommandsFactory.TOGGLE_KEYBOARD)
        end
        MultiPlayerGameFeatureFactory.getInstance():addCommands(canvas)
end

PostGameCommandFactory.instance = PostGameCommandFactory.new()

return PostGameCommandFactory

