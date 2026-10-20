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
-- package org.allbinary.game.displayable.canvas

-- local CommandListener = require("javax.microedition.lcdui.CommandListener")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
-- local NullCommandListener = require("javax.microedition.lcdui.NullCommandListener")
local BasicBuildGameInitializerFactory = require("org.allbinary.game.init.BasicBuildGameInitializerFactory")
local AllBinaryGameLayerManager = require("org.allbinary.game.layer.AllBinaryGameLayerManager")
local NoHighScoresFactory = require("org.allbinary.game.score.NoHighScoresFactory")
local NullUtil = require("org.allbinary.logic.NullUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local AllBinaryGameCanvas = require("org.allbinary.game.displayable.canvas.AllBinaryGameCanvas")

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

local NullGameCanvas = {}
NullGameCanvas.__index = NullGameCanvas
NullGameCanvas.className = "NullGameCanvas"
setmetatable(NullGameCanvas, {__index = AllBinaryGameCanvas})

function NullGameCanvas:_init_fields()
    self.runningNull = true
end


function NullGameCanvas.createNull()
        local try_ok, try_error = pcall(function()
            return NullGameCanvas.new(AllBinaryGameLayerManager.getNullInstance())
        end)
        if not try_ok then
            local e = try_error
            LogUtil.getInstance():put(CommonStrings.getInstance().EXCEPTION, "NullGameCanvas", CommonStrings.getInstance().GET_INSTANCE, e)
            error(java_exception("RuntimeException"), 0)
        end
end


function NullGameCanvas.getInstance()
        if NullGameCanvas.instance == NullUtil.getInstance().NULL_OBJECT then
            NullGameCanvas.instance = NullGameCanvas.createNull()
        end
        return NullGameCanvas.instance
end


-- throws Exception
function NullGameCanvas.createCanvas(gameLayerManager)
        local nullGameCanvas = NullGameCanvas.new(gameLayerManager)
        nullGameCanvas:setInitialized(true)
        nullGameCanvas:setTitle(NullGameCanvas.NO_GAME)
        return nullGameCanvas
end


function NullGameCanvas.new(gameLayerManager)
    local self = setmetatable(AllBinaryGameCanvas.new(NullCommandListener.NULL_COMMAND_LISTENER, gameLayerManager, NoHighScoresFactory.getInstance(), BasicBuildGameInitializerFactory.NULL_BASE_BUILD_GMAE_INITIALIZER_FACTORY, false), NullGameCanvas)
    self:_init_fields()
        -- super(...) made self above
        AllBinaryGameCanvas.setWait(self, 1200)
    return self
end


function NullGameCanvas:isGameOver()
        return false
end


function NullGameCanvas:setRunning(running)
        self.runningNull = running
end


function NullGameCanvas:isRunning()
        return self.runningNull
end


function NullGameCanvas:pause()
        self:setPaused(true)
end


function NullGameCanvas:unPause()
        self:setPaused(false)
end


function NullGameCanvas:initCommands(cmdListener)
        self:removeAllCommands()
        self:setCommandListener(cmdListener)
end


-- throws Exception
function NullGameCanvas:buildGameInit(isProgress)
end


function NullGameCanvas:draw(graphics)
end


function NullGameCanvas:run()
        local try_ok, try_error = pcall(function()
            self.logUtil:putF(self.commonStrings.START_RUNNABLE, self, self.commonStrings.RUN)
            self.logUtil:putF(self.commonStrings.END_RUNNABLE, self, self.commonStrings.RUN)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.RUN, e)
        end
end


function NullGameCanvas:getType()
        return NullGameCanvas.TYPE
end

NullGameCanvas.instance = NullUtil.getInstance().NULL_OBJECT
NullGameCanvas.NO_GAME = "No Background Game"
NullGameCanvas.TYPE = 1

return NullGameCanvas

