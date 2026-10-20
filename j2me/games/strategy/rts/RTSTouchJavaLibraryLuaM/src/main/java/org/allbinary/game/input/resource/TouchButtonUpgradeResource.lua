-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2007 AllBinary 
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
-- package org.allbinary.game.input.resource

local TouchButtonResource = require("org.allbinary.input.motion.button.TouchButtonResource")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TouchButtonUpgradeResource = {}
TouchButtonUpgradeResource.__index = TouchButtonUpgradeResource
TouchButtonUpgradeResource.className = "TouchButtonUpgradeResource"
setmetatable(TouchButtonUpgradeResource, {__index = TouchButtonResource})


function TouchButtonUpgradeResource.getInstance()
        return TouchButtonUpgradeResource.instance
end


function TouchButtonUpgradeResource.new()
    local self = setmetatable(TouchButtonResource.new("/touch_button_upgrade_64_by_64.png", "/touch_button_upgrade_hint_64_by_64.png"), TouchButtonUpgradeResource)
        -- super(...) made self above
    return self
end

TouchButtonUpgradeResource.instance = TouchButtonUpgradeResource.new()

return TouchButtonUpgradeResource

