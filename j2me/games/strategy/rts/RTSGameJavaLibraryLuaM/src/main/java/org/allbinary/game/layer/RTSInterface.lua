-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2003 AllBinary 
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

-- Java interface
local RTSInterface = {}
RTSInterface.__index = RTSInterface
RTSInterface.className = "RTSInterface"


function RTSInterface:isSelfUpgradeable()
    error("abstract method isSelfUpgradeable")
end


function RTSInterface:isCompleted()
    error("abstract method isCompleted")
end


function RTSInterface:getPercentComplete()
    error("abstract method getPercentComplete")
end


function RTSInterface:getLevel()
    error("abstract method getLevel")
end


function RTSInterface:getMaxLevel()
    error("abstract method getMaxLevel")
end


function RTSInterface:getCost()
    error("abstract method getCost")
end


function RTSInterface:downgrade()
    error("abstract method downgrade")
end


function RTSInterface:getDowngradeCost()
    error("abstract method getDowngradeCost")
end


function RTSInterface:isDowngradeable()
    error("abstract method isDowngradeable")
end


function RTSInterface:getUpgradeCost()
    error("abstract method getUpgradeCost")
end


function RTSInterface:isUpgradeable()
    error("abstract method isUpgradeable")
end


function RTSInterface:upgrade()
    error("abstract method upgrade")
end

return RTSInterface

