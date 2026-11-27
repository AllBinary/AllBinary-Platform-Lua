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
-- package org.allbinary.canvas

local SpecialMessageUtil = {}
package.loaded["org.allbinary.canvas.SpecialMessageUtil"] = SpecialMessageUtil

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

local Features = java_lazy("org.allbinary.game.configuration.feature.Features")
local OpenGLFeatureFactory = java_lazy("org.allbinary.graphics.opengles.OpenGLFeatureFactory")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local Memory = java_lazy("org.allbinary.system.Memory")
local GameStatisticsFactory = java_lazy("org.allbinary.canvas.GameStatisticsFactory")

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

-- class table SpecialMessageUtil is declared before the requires
SpecialMessageUtil.__index = SpecialMessageUtil
SpecialMessageUtil.className = "SpecialMessageUtil"
SpecialMessageUtil.javaClassName = "org.allbinary.canvas.SpecialMessageUtil"

function SpecialMessageUtil._jinit(self)
    return self
end

function SpecialMessageUtil.new()
    return SpecialMessageUtil._jinit(setmetatable({}, SpecialMessageUtil))
end


function SpecialMessageUtil.getInstance()
        return SpecialMessageUtil.SINGLETON
end


function SpecialMessageUtil:get()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(Memory.getInfo())
        stringBuffer:append(CommonSeps.getInstance().SPACE)
        stringBuffer:append(tostring(GameStatisticsFactory.getInstance()))
        stringBuffer:append(CommonSeps.getInstance().SPACE)
        stringBuffer:append(" Option: ")
        if Features.getInstance():isDefault(OpenGLFeatureFactory.getInstance().OPENGL_AUTO_SELECT) then
            stringBuffer:append(OpenGLFeatureFactory.getInstance().OPENGL_AUTO_SELECT:getName())
        else
            stringBuffer:append(OpenGLFeatureFactory.getInstance().OPENGL_MINIMUM:getName())
        end
        return tostring(stringBuffer)
end

SpecialMessageUtil.SINGLETON = SpecialMessageUtil.new()

return SpecialMessageUtil

