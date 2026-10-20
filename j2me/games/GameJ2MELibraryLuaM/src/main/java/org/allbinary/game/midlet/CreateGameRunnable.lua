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

local ProgressCanvas = require("org.allbinary.graphics.canvas.transition.progress.ProgressCanvas")
local ProgressCanvasFactory = require("org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory")
local MyCommandsFactory = require("org.allbinary.graphics.displayable.command.MyCommandsFactory")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local ABHashtable = require("org.allbinary.util.ABHashtable")
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

local CreateGameRunnable = {}
CreateGameRunnable.__index = CreateGameRunnable
CreateGameRunnable.className = "CreateGameRunnable"

function CreateGameRunnable:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.demoGameMidlet = nil
    self.hashtable = nil
    self.startGameMidletEvent = nil
end


function CreateGameRunnable.new(demoGameMidlet, hashtable)
    local self = setmetatable({}, CreateGameRunnable)
    self:_init_fields()
        self.demoGameMidlet = demoGameMidlet
        self.hashtable = hashtable
        self.startGameMidletEvent = DemoGameMidletEvent.new(self, DemoGameMidletStateFactory.getInstance().START_GAME)
    return self
end


function CreateGameRunnable:run()
        local try_ok, try_error = pcall(function()
            self.logUtil:putF(self.commonStrings.START_RUNNABLE, self, self.commonStrings.RUN)
            local progressCanvas = ProgressCanvasFactory.getInstance()
            self.demoGameMidlet:commandAction(MyCommandsFactory.getInstance().SET_DISPLAYABLE, progressCanvas)
            self.demoGameMidlet:stopGameCanvasRunnableInterface()
            self.demoGameMidlet:setGameCanvasRunnableInterface(self.demoGameMidlet:createGameCanvasRunnableInterface())
            self.demoGameMidlet:getGameCanvasRunnableInterface():setLoadStateHashtable(self.hashtable)
            self.demoGameMidlet:startGameCanvasRunnableInterface()
            DemoGameMidletEventHandler.getInstance():fireEvent(self.startGameMidletEvent)
            self.logUtil:putF(self.commonStrings.END_RUNNABLE, self, self.commonStrings.RUN)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.RUN, e)
        end
end

return CreateGameRunnable

