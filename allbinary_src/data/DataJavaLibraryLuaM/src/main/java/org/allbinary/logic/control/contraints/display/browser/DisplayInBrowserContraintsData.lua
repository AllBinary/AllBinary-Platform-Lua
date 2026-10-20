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

local DisplayInBrowserContraintsData = {}
DisplayInBrowserContraintsData.__index = DisplayInBrowserContraintsData
DisplayInBrowserContraintsData.className = "DisplayInBrowserContraintsData"


function DisplayInBrowserContraintsData.new()
    local self = setmetatable({}, DisplayInBrowserContraintsData)
    return self
end

DisplayInBrowserContraintsData.NAME = "DISPLAYBROWSERCONSTRAINTS_NAME"
DisplayInBrowserContraintsData.FRAMEABLE = "DISPLAYBROWSERCONSTRAINTS_FRAMEABLE"
DisplayInBrowserContraintsData.MOUNTABLE = "DISPLAYBROWSERCONSTRAINTS_MOUNTABLE"
DisplayInBrowserContraintsData.QUICKFRAMEABLE = "DISPLAYBROWSERCONSTRAINTS_QUICKFRAMEABLE"
DisplayInBrowserContraintsData.MOUNTABLELINK = "DISPLAYBROWSERCONSTRAINTS_MOUNTABLELINK"

return DisplayInBrowserContraintsData

