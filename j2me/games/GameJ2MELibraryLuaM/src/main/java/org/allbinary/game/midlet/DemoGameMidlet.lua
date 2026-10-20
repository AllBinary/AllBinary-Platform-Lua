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

local GameCanvasRunnableInterface = require("org.allbinary.game.displayable.canvas.GameCanvasRunnableInterface")
local AllBinaryGameLayerManager = require("org.allbinary.game.layer.AllBinaryGameLayerManager")
local ProgressCanvas = require("org.allbinary.graphics.canvas.transition.progress.ProgressCanvas")
local ProgressCanvasFactory = require("org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory")
local StdUtil = require("org.allbinary.logic.StdUtil")
local ClientInformationFactory = require("org.allbinary.logic.system.security.licensing.ClientInformationFactory")
local PrimaryThreadPool = require("org.allbinary.thread.PrimaryThreadPool")
local NullGameCanvasRunnable = require("org.allbinary.game.displayable.canvas.NullGameCanvasRunnable")
local ABHashtable = require("org.allbinary.util.ABHashtable")
local GameMidlet = require("org.allbinary.game.midlet.GameMidlet")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local DemoGameMidlet = {}
DemoGameMidlet.__index = DemoGameMidlet
DemoGameMidlet.className = "DemoGameMidlet"
setmetatable(DemoGameMidlet, {__index = GameMidlet})


function DemoGameMidlet.new(clientInformationFactory)
    local self = setmetatable(GameMidlet.new(clientInformationFactory), DemoGameMidlet)
        -- super(...) made self above
    return self
end


-- throws Exception
function DemoGameMidlet:isContinue()
        local hashtable = self:getStartStateHashtable()
        if hashtable ~= nil and hashtable:size() > 0 then
            return true
        else
            return false
        end
end


function DemoGameMidlet:getHighestLevel()
        return 1
end


-- throws Exception
function DemoGameMidlet:createDemoGameCanvasRunnableInterface()
        self.logUtil:putF(self.commonStrings.NOT_IMPLEMENTED, self, self.commonStrings.CREATE)
        return NullGameCanvasRunnable.NULL_GAME_CANVAS_RUNNABLE
end


-- throws Exception
function DemoGameMidlet:createGameCanvasRunnable(allBinaryGameLayerManager)
        error(java_exception("Exception", self.commonStrings.NOT_IMPLEMENTED), 0)
end


-- throws Exception
function DemoGameMidlet:createGameCanvasRunnableInterface()
        return self:createGameCanvasRunnable(self:createGameLayerManager())
end


function DemoGameMidlet:demoSetup()
end


function DemoGameMidlet:postDemoSetup()
end


-- throws Exception
function DemoGameMidlet:setDemo()
        self.logUtil:putF(self.commonStrings.START, self, "setDemo")
        local progressCanvas = ProgressCanvasFactory.getInstance()
        progressCanvas:start()
        PrimaryThreadPool.getInstance():runTask(DemoRunnable.new(self))
end


-- throws Exception
function DemoGameMidlet:createGame()
        local CREATE_GAME = "createGame"
        self.logUtil:putF(self.commonStrings.START, self, CREATE_GAME)
        local progressCanvas = ProgressCanvasFactory.getInstance()
        progressCanvas:start()
        local hashtable = self:getStartStateHashtable()
        self:setStartStateHashtable(StdUtil.getInstance().NULL_TABLE)
        PrimaryThreadPool.getInstance():runTask(CreateGameRunnable.new(self, hashtable))
        self.logUtil:putF(self.commonStrings.END, self, CREATE_GAME)
end


function DemoGameMidlet:isReady()
        return true
end

return DemoGameMidlet

