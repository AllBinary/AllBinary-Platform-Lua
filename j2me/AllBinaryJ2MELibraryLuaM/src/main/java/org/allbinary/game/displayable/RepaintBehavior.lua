-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2022 AllBinary 
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
-- package org.allbinary.game.displayable

local RepaintBehavior = {}
package.loaded["org.allbinary.game.displayable.RepaintBehavior"] = RepaintBehavior

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
local DisplayInfoSingleton = java_lazy("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local OpenGLFeatureFactory = java_lazy("org.allbinary.graphics.opengles.OpenGLFeatureFactory")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local NullRunnable = java_lazy("org.allbinary.thread.NullRunnable")
local RepaintRunnable = java_lazy("org.allbinary.game.displayable.RepaintRunnable")

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

-- class table RepaintBehavior is declared before the requires
RepaintBehavior.__index = RepaintBehavior
RepaintBehavior.className = "RepaintBehavior"
RepaintBehavior.javaClassName = "org.allbinary.game.displayable.RepaintBehavior"

function RepaintBehavior:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.NAME = "RepaintBehavior"
end

function RepaintBehavior._jinit(self)
    RepaintBehavior._init_fields(self)
    return self
end

function RepaintBehavior.new()
    return RepaintBehavior._jinit(setmetatable({}, RepaintBehavior))
end


function RepaintBehavior.getInstance()
        return RepaintBehavior.instance_f
end


function RepaintBehavior:repaint(canvas)
end


function RepaintBehavior:onChangeRepaint(canvas)
        local features = Features.getInstance()
        local openGLFeatureFactory = OpenGLFeatureFactory.getInstance()
        if features:isFeature(openGLFeatureFactory.OPENGL) then
            DisplayInfoSingleton.getInstance():process()
        else
            local thread = require("java.lang.Thread").new(RepaintRunnable.new(canvas), self.NAME)
            thread:start()
        end
end

RepaintBehavior.instance_f = RepaintBehavior.new()

return RepaintBehavior

