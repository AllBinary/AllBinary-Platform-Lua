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

local ARunnable = require("org.allbinary.thread.ARunnable")
-- local Canvas = require("javax.microedition.lcdui.Canvas")
local Features = require("org.allbinary.game.configuration.feature.Features")
local DisplayInfoSingleton = require("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local OpenGLFeatureFactory = require("org.allbinary.graphics.opengles.OpenGLFeatureFactory")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local NullRunnable = require("org.allbinary.thread.NullRunnable")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local RepaintBehavior = {}
RepaintBehavior.__index = RepaintBehavior
RepaintBehavior.className = "RepaintBehavior"

function RepaintBehavior:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.NAME = "RepaintBehavior"
end

function RepaintBehavior.new()
    local self = setmetatable({}, RepaintBehavior)
    self:_init_fields()
    return self
end


function RepaintBehavior.getInstance()
        return RepaintBehavior.instance
end


function RepaintBehavior:repaint(canvas)
end


function RepaintBehavior:onChangeRepaint(canvas)
        local features = Features.getInstance()
        local openGLFeatureFactory = OpenGLFeatureFactory.getInstance()
        if features:isFeature(openGLFeatureFactory.OPENGL) then
            DisplayInfoSingleton.getInstance():process()
        else
            local thread = Thread.new((function()
                local o = ARunnable.new and ARunnable.new() or setmetatable({}, {__index = ARunnable})
                

                function o:run()
                    local try_ok, try_error = pcall(function()
                        canvas:repaint()
                        DisplayInfoSingleton.getInstance():process()
                    end)
                    if not try_ok then
                        local e = try_error
                        local commonStrings = CommonStrings.getInstance()
                        local logUtil = LogUtil.getInstance()
                        logUtil:put(commonStrings.EXCEPTION, self, commonStrings.RUN, e)
                    end
                end
                return o
            end)(), self.NAME)
            thread:start()
        end
end

RepaintBehavior.instance = RepaintBehavior.new()

return RepaintBehavior

