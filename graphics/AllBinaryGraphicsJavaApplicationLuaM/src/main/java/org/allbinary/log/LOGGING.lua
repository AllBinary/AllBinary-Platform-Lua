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

local LOGGING = {}
package.loaded["org.allbinary.log.LOGGING"] = LOGGING

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

local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")

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

-- class table LOGGING is declared before the requires
LOGGING.__index = LOGGING
LOGGING.className = "LOGGING"
LOGGING.javaClassName = "org.allbinary.log.LOGGING"

function LOGGING:_init_fields()
    if self.name_f == nil then self.name_f = nil end
end


function LOGGING._jinit(self, value)
    LOGGING._init_fields(self)
        self.name_f = value
        LOGGING.logging:add(value)
    return self
end

function LOGGING.new(...)
    local self = setmetatable({}, LOGGING)
    LOGGING._jinit(self, ...)
    return self
end


function LOGGING.contains(logType)
        return LOGGING.logging:contains(tostring(logType))
end


function LOGGING:toString()
        return self.name_f
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

