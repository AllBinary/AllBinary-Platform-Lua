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

local FullScreenUtil = {}
package.loaded["org.allbinary.canvas.FullScreenUtil"] = FullScreenUtil

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

-- local Canvas = require("javax.microedition.lcdui.Canvas")
local Features = java_lazy("org.allbinary.game.configuration.feature.Features")
local MainFeatureFactory = java_lazy("org.allbinary.game.configuration.feature.MainFeatureFactory")
-- local CommandListener = require("javax.microedition.lcdui.CommandListener")
local RunnableCanvas = java_lazy("org.allbinary.canvas.RunnableCanvas")

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

-- class table FullScreenUtil is declared before the requires
FullScreenUtil.__index = FullScreenUtil
FullScreenUtil.className = "FullScreenUtil"
FullScreenUtil.javaClassName = "org.allbinary.canvas.FullScreenUtil"

function FullScreenUtil._jinit(self)
    return self
end

function FullScreenUtil.new()
    return FullScreenUtil._jinit(setmetatable({}, FullScreenUtil))
end


function FullScreenUtil.getInstance()
        return FullScreenUtil.instance_f
end


-- throws Exception
function FullScreenUtil:initOnRun(fullScreenInterface, commandListener)
        ;(fullScreenInterface):waitOnNotify(0)
        if commandListener ~= nil then
            self:init(fullScreenInterface)
        end
end


function FullScreenUtil:init(fullScreenInterface)
        local mainFeatureFactory = MainFeatureFactory.getInstance()
        local features = Features.getInstance()
        if features:isFeature(mainFeatureFactory.FULL_SCREEN) then
            fullScreenInterface:setFullScreenMode(true)
        else
            fullScreenInterface:setFullScreenMode(false)
        end
end


function FullScreenUtil:isScreenChange(isFullScreen)
        local mainFeatureFactory = MainFeatureFactory.getInstance()
        local features = Features.getInstance()
        if features:isFeature(mainFeatureFactory.FULL_SCREEN) ~= isFullScreen then
            return true
        end
        return false
end


function FullScreenUtil:isScreenChangeCanvas(fullScreenInterface)
        return self:isScreenChange(fullScreenInterface:isFullScreenMode())
end

FullScreenUtil.instance_f = FullScreenUtil.new()

return FullScreenUtil

