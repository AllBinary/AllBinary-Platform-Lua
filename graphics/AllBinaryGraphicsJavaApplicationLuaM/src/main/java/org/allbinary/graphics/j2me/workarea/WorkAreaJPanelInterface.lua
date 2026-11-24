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
-- package org.allbinary.graphics.j2me.workarea

local WorkAreaJPanelInterface = {}
package.loaded["org.allbinary.graphics.j2me.workarea.WorkAreaJPanelInterface"] = WorkAreaJPanelInterface

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

local Document = java_lazy("org.w3c.dom.Document")
-- local KeyListener = require("java.awt.event.KeyListener")

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

-- Java interface
-- class table WorkAreaJPanelInterface is declared before the requires
WorkAreaJPanelInterface.__index = WorkAreaJPanelInterface
WorkAreaJPanelInterface.className = "WorkAreaJPanelInterface"
WorkAreaJPanelInterface.javaClassName = "org.allbinary.graphics.j2me.workarea.WorkAreaJPanelInterface"
setmetatable(WorkAreaJPanelInterface, {__index = KeyListener})
WorkAreaJPanelInterface.java_interfaces = function() return {KeyListener} end


function WorkAreaJPanelInterface:getName()
    error("abstract method getName")
end


function WorkAreaJPanelInterface:deselect()
    error("abstract method deselect")
end


function WorkAreaJPanelInterface:select()
    error("abstract method select")
end


function WorkAreaJPanelInterface:changeZoom(factor)
    error("abstract method changeZoom")
end


function WorkAreaJPanelInterface:explodeAll()
    error("abstract method explodeAll")
end


-- throws Exception
function WorkAreaJPanelInterface:autoRotate(increments, totalAngle)
    error("abstract method autoRotate")
end


-- throws Exception
function WorkAreaJPanelInterface:autoExplode(numberOfFrames, explodeType)
    error("abstract method autoExplode")
end


-- throws Exception
function WorkAreaJPanelInterface:autoMirror()
    error("abstract method autoMirror")
end


function WorkAreaJPanelInterface:play()
    error("abstract method play")
end


function WorkAreaJPanelInterface:stop()
    error("abstract method stop")
end


function WorkAreaJPanelInterface:isPlaying()
    error("abstract method isPlaying")
end


-- throws Exception
function WorkAreaJPanelInterface:toDocument()
    error("abstract method toDocument")
end

return WorkAreaJPanelInterface

