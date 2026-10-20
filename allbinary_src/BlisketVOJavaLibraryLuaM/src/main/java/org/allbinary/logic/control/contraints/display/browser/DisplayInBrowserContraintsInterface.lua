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
-- package org.allbinary.logic.control.contraints.display.browser


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
local DisplayInBrowserContraintsInterface = {}
DisplayInBrowserContraintsInterface.__index = DisplayInBrowserContraintsInterface
DisplayInBrowserContraintsInterface.className = "DisplayInBrowserContraintsInterface"


function DisplayInBrowserContraintsInterface:isMountable()
    error("abstract method isMountable")
end


function DisplayInBrowserContraintsInterface:isFrameable()
    error("abstract method isFrameable")
end


function DisplayInBrowserContraintsInterface:isQuickFrameable()
    error("abstract method isQuickFrameable")
end


function DisplayInBrowserContraintsInterface:setMountable(canBeMounted)
    error("abstract method setMountable")
end


function DisplayInBrowserContraintsInterface:setFrameable(canBeFramed)
    error("abstract method setFrameable")
end


function DisplayInBrowserContraintsInterface:setQuickFrameable(canBeQuickFramed)
    error("abstract method setQuickFrameable")
end


function DisplayInBrowserContraintsInterface:setMountedLink(mountedLink)
    error("abstract method setMountedLink")
end


function DisplayInBrowserContraintsInterface:getMountedLink()
    error("abstract method getMountedLink")
end

return DisplayInBrowserContraintsInterface

