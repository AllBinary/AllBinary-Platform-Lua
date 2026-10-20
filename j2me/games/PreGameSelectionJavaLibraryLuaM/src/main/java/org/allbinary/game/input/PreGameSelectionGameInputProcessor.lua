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
-- package org.allbinary.game.input

-- local Canvas = require("javax.microedition.lcdui.Canvas")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local LockedFeatureNotificationUtil = require("org.allbinary.logic.system.security.licensing.LockedFeatureNotificationUtil")
local LockedUtil = require("org.allbinary.logic.system.security.licensing.LockedUtil")
local Processor = require("org.allbinary.canvas.Processor")
local AllBinaryGameCanvas = require("org.allbinary.game.displayable.canvas.AllBinaryGameCanvas")
local PreGameSelectorPaintable = require("org.allbinary.game.displayable.canvas.PreGameSelectorPaintable")
local GameKeyEventHandler = require("org.allbinary.game.input.event.GameKeyEventHandler")
local GameKeyEventUtil = require("org.allbinary.game.input.event.GameKeyEventUtil")
local GameState = require("org.allbinary.game.state.GameState")
local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local SecondaryPlayerQueueFactory = require("org.allbinary.media.audio.SecondaryPlayerQueueFactory")
local SelectSound = require("org.allbinary.media.audio.SelectSound")
local ABRunnable = require("org.allbinary.thread.ABRunnable")
local ThreadObjectUtil = require("org.allbinary.thread.ThreadObjectUtil")
local TimeDelayHelper = require("org.allbinary.time.TimeDelayHelper")
local GameInputProcessorInterface = require("org.allbinary.game.input.GameInputProcessorInterface")
local PlayerGameInputCompositeInterface = require("org.allbinary.game.input.PlayerGameInputCompositeInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PreGameSelectionGameInputProcessor = {}
PreGameSelectionGameInputProcessor.__index = PreGameSelectionGameInputProcessor
PreGameSelectionGameInputProcessor.className = "PreGameSelectionGameInputProcessor"
setmetatable(PreGameSelectionGameInputProcessor, {__index = Processor})

function PreGameSelectionGameInputProcessor:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.gameCanvas = nil
    self.preGameSelectorPaintable = nil
    self.inputTimeHelper = TimeDelayHelper.new(650)
    self.nextGameState = nil
    self.playerGameInput = nil
    self.lockedIndex = nil
    self.abRunnable = (function()
        local o = ABRunnable.new and ABRunnable.new() or setmetatable({}, {__index = ABRunnable})
        

        function o:run()
            local try_ok, try_error = pcall(function()
                self:setRunning(true)
                SecondaryPlayerQueueFactory.getInstance():add(SelectSound.getInstance())
                self.gameCanvas:setGameState(self.nextGameState)
                GameKeyEventHandler.getInstance():removeListener(self:getPlayerGameInput())
                self:setRunning(false)
            end)
            if not try_ok then
                local e = try_error
                self:setRunning(false)
                local logUtil = LogUtil.getInstance()
                local commonStrings = CommonStrings.getInstance()
                logUtil:put(commonStrings.EXCEPTION, self, commonStrings.RUN, e)
            end
        end
        return o
    end)()
end


function PreGameSelectionGameInputProcessor.new(gameCanvas, preGameSelectorPaintable, nextGameState, lockedIndex)
    local self = setmetatable(Processor.new(), PreGameSelectionGameInputProcessor)
    self:_init_fields()
        self.gameCanvas = gameCanvas
        self.preGameSelectorPaintable = preGameSelectorPaintable
        self.nextGameState = nextGameState
        self.playerGameInput = GameInputProcessorComposite.new("Pre Game Selection", self)
        self.lockedIndex = lockedIndex
    return self
end


-- throws Exception
function PreGameSelectionGameInputProcessor:process()
        self:getPlayerGameInput():update()
end


-- throws Exception
function PreGameSelectionGameInputProcessor:onInput(list)
        local size = list:size()
        for index = 0, size - 1 do
            local anyType = list:get(index)
            local key = GameKeyEventUtil.getKey(anyType)
            if key == Canvas.LEFT or key == Canvas.RIGHT or key == Canvas.UP or key == Canvas.DOWN then
                if self.inputTimeHelper:isTimeTNT() then
                    SecondaryPlayerQueueFactory.getInstance():add(SelectSound.getInstance())
                    self:getPreGameSelectorPaintable():getPreGameSelectionForm():processInputKey(key)
                    break
                end
            elseif key == Canvas.KEY_NUM0 then
                local selectedIndex = self.preGameSelectorPaintable:getPreGameSelectionForm():getSelectedIndex()
                if selectedIndex < self.lockedIndex or not LockedUtil.getInstance():isLocked() then
                    if not self.abRunnable:isRunning() then
                        self.abRunnable:setRunning(true)
                        ThreadObjectUtil.getInstance():processThread(self.abRunnable)
                    end
                    break
                else
                    LockedFeatureNotificationUtil.getInstance():fire()
                end
            end
        end
        list:clear()
end


function PreGameSelectionGameInputProcessor:getPreGameSelectorPaintable()
        return self.preGameSelectorPaintable
end


-- throws Exception
function PreGameSelectionGameInputProcessor:processInput(layerManager)
end


function PreGameSelectionGameInputProcessor:initInputProcessors()
end


function PreGameSelectionGameInputProcessor:getName()
        return tostring(self)
end


function PreGameSelectionGameInputProcessor:getPlayerGameInput()
        return self.playerGameInput
end

return PreGameSelectionGameInputProcessor

