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
-- package org.allbinary.game.midlet

local ProgressCanvasFactory = require("org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory")
local MyCommandsFactory = require("org.allbinary.graphics.displayable.command.MyCommandsFactory")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonLabels = require("org.allbinary.string.CommonLabels")
local CommonStrings = require("org.allbinary.string.CommonStrings")
-- java.lang.Runnable has no Lua module
local Runnable = {}

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local DemoRunnable = {}
DemoRunnable.__index = DemoRunnable
DemoRunnable.className = "DemoRunnable"

function DemoRunnable:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.demoGameMidlet = nil
    self.startDemoGameMidletEvent = nil
end


function DemoRunnable.new(demoGameMidlet)
    local self = setmetatable({}, DemoRunnable)
    self:_init_fields()
        self.demoGameMidlet = demoGameMidlet
        self.startDemoGameMidletEvent = DemoGameMidletEvent.new(self.demoGameMidlet, DemoGameMidletStateFactory.getInstance().START_DEMO)
    return self
end


function DemoRunnable:run()
        local try_ok, try_error = pcall(function()
            self.logUtil:putF(tostring(StringMaker.new():append(CommonLabels.getInstance().START_LABEL):append("GameCanvasRunnableInterface")), self, self.commonStrings.RUN)
            self.demoGameMidlet:commandAction(MyCommandsFactory.getInstance().SET_DISPLAYABLE, ProgressCanvasFactory.getInstance())
            self.demoGameMidlet:setGameCanvasRunnableInterface(self.demoGameMidlet:createDemoGameCanvasRunnableInterface())
            self.demoGameMidlet:demoSetup()
            DemoGameMidletEventHandler.getInstance():fireEvent(self.startDemoGameMidletEvent)
            self.demoGameMidlet:startGameCanvasRunnableInterface()
            self.demoGameMidlet:postDemoSetup()
            self.logUtil:putF(self.commonStrings.END_RUNNABLE, self, self.commonStrings.RUN)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.RUN, e)
        end
end

return DemoRunnable

