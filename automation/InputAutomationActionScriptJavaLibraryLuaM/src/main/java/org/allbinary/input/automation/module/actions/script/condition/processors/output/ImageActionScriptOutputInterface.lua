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
-- package org.allbinary.input.automation.module.actions.script.condition.processors.output

local ImageActionScriptOutputInterface = {}
package.loaded["org.allbinary.input.automation.module.actions.script.condition.processors.output.ImageActionScriptOutputInterface"] = ImageActionScriptOutputInterface

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

local ProfileActionScriptOutputInterface = require("org.allbinary.input.automation.module.actions.script.condition.processors.output.ProfileActionScriptOutputInterface")
local ImageTypes = java_lazy("org.allbinary.input.automation.module.actions.script.condition.processors.output.ImageTypes")

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
-- class table ImageActionScriptOutputInterface is declared before the requires
ImageActionScriptOutputInterface.__index = ImageActionScriptOutputInterface
ImageActionScriptOutputInterface.className = "ImageActionScriptOutputInterface"
ImageActionScriptOutputInterface.javaClassName = "org.allbinary.input.automation.module.actions.script.condition.processors.output.ImageActionScriptOutputInterface"
setmetatable(ImageActionScriptOutputInterface, {__index = ProfileActionScriptOutputInterface})
ImageActionScriptOutputInterface.java_interfaces = function() return {ProfileActionScriptOutputInterface} end


function ImageActionScriptOutputInterface:getImageTypes()
    error("abstract method getImageTypes")
end


function ImageActionScriptOutputInterface:setImageTypes(imageTypes)
    error("abstract method setImageTypes")
end


function ImageActionScriptOutputInterface:isSaved()
    error("abstract method isSaved")
end


function ImageActionScriptOutputInterface:setSaved(saved)
    error("abstract method setSaved")
end


function ImageActionScriptOutputInterface:isDisplay()
    error("abstract method isDisplay")
end


function ImageActionScriptOutputInterface:setDisplay(display)
    error("abstract method setDisplay")
end


function ImageActionScriptOutputInterface:log()
    error("abstract method log")
end

return ImageActionScriptOutputInterface

