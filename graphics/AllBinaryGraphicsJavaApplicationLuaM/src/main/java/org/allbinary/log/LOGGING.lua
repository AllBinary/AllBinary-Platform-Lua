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
-- package org.allbinary.log

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local StdUtil = require("org.allbinary.logic.StdUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local LOGGING = {}
LOGGING.__index = LOGGING
LOGGING.className = "LOGGING"

function LOGGING:_init_fields()
    self.name = nil
end


function LOGGING.new(value)
    local self = setmetatable({}, LOGGING)
    self:_init_fields()
        self.name = value
        self.LOGGING.logging:add(value)
    return self
end


function LOGGING.contains(logType)
        return self.LOGGING.logging:contains(tostring(logType))
end


function LOGGING:toString()
        return self.name
end
LOGGING.__tostring = function(self) return self:toString() end

LOGGING.logging = BasicArrayListD.new()
LOGGING.GRAPHICSPAINT = LOGGING.new("Graphics Paint")
LOGGING.GRAPHICSCREATION = LOGGING.new("Graphics Creation")
LOGGING.GRAPHICSDELETION = LOGGING.new("Graphics Deletion")
LOGGING.LOADINGERROR = LOGGING.new("Loading Error")
LOGGING.MENUEVENT = LOGGING.new("Menu Action Event")
LOGGING.MOUSEEVENT = LOGGING.new("Mouse Action Event")
LOGGING.KEYEVENT = LOGGING.new("Keyboard Action Event")
LOGGING.ACTIONEVENT = LOGGING.new("Action Event")
LOGGING.ADJUSTMENTEVENT = LOGGING.new("Adjustment Action Event")
LOGGING.COMPONENTEVENT = LOGGING.new("Component Action Event")
LOGGING.CONTAINEREVENT = LOGGING.new("Container Action Event")
LOGGING.FOCUSEVENT = LOGGING.new("Focus Action Event")
LOGGING.HIERARCHYEVENT = LOGGING.new("Hierarchy Action Event")
LOGGING.INPUTEVENT = LOGGING.new("Input Action Event")
LOGGING.INVOCATIONEVENT = LOGGING.new("Invocation Action Event")
LOGGING.ITEMEVENT = LOGGING.new("Item Action Event")
LOGGING.PAINTEVENT = LOGGING.new("Paint Action Event")
LOGGING.TEXTEVENT = LOGGING.new("Text Action Event")
LOGGING.WINDOWEVENT = LOGGING.new("Window Action Event")

return LOGGING

