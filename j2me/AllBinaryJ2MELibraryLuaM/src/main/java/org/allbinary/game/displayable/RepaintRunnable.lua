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

-- local Canvas = require("javax.microedition.lcdui.Canvas")
local DisplayInfoSingleton = require("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local ARunnable = require("org.allbinary.thread.ARunnable")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local RepaintRunnable = {}
RepaintRunnable.__index = RepaintRunnable
RepaintRunnable.className = "RepaintRunnable"
setmetatable(RepaintRunnable, {__index = ARunnable})

function RepaintRunnable:_init_fields()
    self.canvas = nil
end


function RepaintRunnable.new(canvas)
    local self = setmetatable(ARunnable.new(), RepaintRunnable)
    self:_init_fields()
        self.canvas = canvas
    return self
end


function RepaintRunnable:run()
        local try_ok, try_error = pcall(function()
            self.canvas:repaint()
            DisplayInfoSingleton.getInstance():process()
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            local logUtil = LogUtil.getInstance()
            logUtil:put(commonStrings.EXCEPTION, self, commonStrings.RUN, e)
        end
end

return RepaintRunnable

