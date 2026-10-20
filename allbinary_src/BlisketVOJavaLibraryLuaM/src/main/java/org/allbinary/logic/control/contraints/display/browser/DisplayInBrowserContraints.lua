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

local Node = require("org.w3c.dom.Node")
local DisplayInBrowserContraintsInterface = require("org.allbinary.logic.control.contraints.display.browser.DisplayInBrowserContraintsInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local DisplayInBrowserContraints = {}
DisplayInBrowserContraints.__index = DisplayInBrowserContraints
DisplayInBrowserContraints.className = "DisplayInBrowserContraints"

function DisplayInBrowserContraints:_init_fields()
    self.frameable = false
    self.mountable = false
    self.quickFrameable = false
    self.mountedLink = nil
end


function DisplayInBrowserContraints.new(node)
    local self = setmetatable({}, DisplayInBrowserContraints)
    self:_init_fields()
    return self
end


function DisplayInBrowserContraints:isMountable()
        return self.mountable
end


function DisplayInBrowserContraints:setMountable(mountable)
        self.mountable = mountable
end


function DisplayInBrowserContraints:isFrameable()
        return self.frameable
end


function DisplayInBrowserContraints:setFrameable(frameable)
        self.frameable = frameable
end


function DisplayInBrowserContraints:isQuickFrameable()
        return self.quickFrameable
end


function DisplayInBrowserContraints:setQuickFrameable(quickFrameable)
        self.quickFrameable = quickFrameable
end


function DisplayInBrowserContraints:getMountedLink()
        return self.mountedLink
end


function DisplayInBrowserContraints:setMountedLink(mountedLink)
        self.mountedLink = mountedLink
end

return DisplayInBrowserContraints

