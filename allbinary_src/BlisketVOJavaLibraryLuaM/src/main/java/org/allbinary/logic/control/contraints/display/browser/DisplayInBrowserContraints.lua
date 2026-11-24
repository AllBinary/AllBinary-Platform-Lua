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

local DisplayInBrowserContraints = {}
package.loaded["org.allbinary.logic.control.contraints.display.browser.DisplayInBrowserContraints"] = DisplayInBrowserContraints

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

local Node = java_lazy("org.w3c.dom.Node")
local DisplayInBrowserContraintsInterface = require("org.allbinary.logic.control.contraints.display.browser.DisplayInBrowserContraintsInterface")

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

-- class table DisplayInBrowserContraints is declared before the requires
DisplayInBrowserContraints.__index = DisplayInBrowserContraints
DisplayInBrowserContraints.className = "DisplayInBrowserContraints"
DisplayInBrowserContraints.javaClassName = "org.allbinary.logic.control.contraints.display.browser.DisplayInBrowserContraints"
DisplayInBrowserContraints.java_implements = " DisplayInBrowserContraintsInterface "
DisplayInBrowserContraints.java_interfaces = function() return {DisplayInBrowserContraintsInterface} end

function DisplayInBrowserContraints:_init_fields()
    if self.frameable == nil then self.frameable = false end
    if self.mountable == nil then self.mountable = false end
    if self.quickFrameable == nil then self.quickFrameable = false end
    if self.mountedLink == nil then self.mountedLink = nil end
end


function DisplayInBrowserContraints._jinit(self, node)
    DisplayInBrowserContraints._init_fields(self)
    return self
end

function DisplayInBrowserContraints.new(...)
    local self = setmetatable({}, DisplayInBrowserContraints)
    DisplayInBrowserContraints._jinit(self, ...)
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

