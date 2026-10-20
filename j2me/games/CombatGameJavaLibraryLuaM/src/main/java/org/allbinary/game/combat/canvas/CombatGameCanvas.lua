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
-- package org.allbinary.game.combat.canvas

-- local CommandListener = require("javax.microedition.lcdui.CommandListener")
local DestroyedLayerProcessor = require("org.allbinary.game.combat.destroy.DestroyedLayerProcessor")
local DestroyEventCircularStaticPool = require("org.allbinary.game.combat.destroy.event.DestroyEventCircularStaticPool")
local DestroyedEventHandler = require("org.allbinary.game.combat.destroy.event.DestroyedEventHandler")
local Features = require("org.allbinary.game.configuration.feature.Features")
local GameFeatureFactory = require("org.allbinary.game.configuration.feature.GameFeatureFactory")
local AllBinaryGameCanvas = require("org.allbinary.game.displayable.canvas.AllBinaryGameCanvas")
local BasicBuildGameInitializerFactory = require("org.allbinary.game.init.BasicBuildGameInitializerFactory")
local AllBinaryGameLayerManager = require("org.allbinary.game.layer.AllBinaryGameLayerManager")
local DropLayerProcessor = require("org.allbinary.game.layer.drop.DropLayerProcessor")
local GroupLayerManagerListener = require("org.allbinary.game.layer.identification.GroupLayerManagerListener")
local HighScoresFactoryInterface = require("org.allbinary.game.score.HighScoresFactoryInterface")
local ProgressCanvasFactory = require("org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory")
local BasicLayerProcessor = require("org.allbinary.layer.BasicLayerProcessor")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
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

local CombatGameCanvas = {}
CombatGameCanvas.__index = CombatGameCanvas
CombatGameCanvas.className = "CombatGameCanvas"
setmetatable(CombatGameCanvas, {__index = AllBinaryGameCanvas})


function CombatGameCanvas.new(cmdListener, gameLayerManager, highScoresFactoryInterface, gameInitializationInterfaceFactoryInterface, buffered)
    local self = setmetatable(AllBinaryGameCanvas.new(cmdListener, gameLayerManager, highScoresFactoryInterface, gameInitializationInterfaceFactoryInterface, buffered), CombatGameCanvas)
        -- super(...) made self above
    return self
end


function CombatGameCanvas:CombatGameCanvas_init()
        DestroyEventCircularStaticPool.getInstance():init(self)
        ProgressCanvasFactory.getInstance():addNormalPortion(50, "Destroy Events")
end


-- throws Exception
function CombatGameCanvas:initApp(abeClientInformation)
        self:CombatGameCanvas_init()
        AllBinaryGameCanvas.initApp(self, abeClientInformation)
end


function CombatGameCanvas:initConfigurablePortion(portion)
        DestroyedLayerProcessor.init()
        ProgressCanvasFactory.getInstance():addNormalPortion(portion, "Basic Processors")
        local features = Features.getInstance()
        local gameFeatureFactory = GameFeatureFactory.getInstance()
        if features:isFeature(gameFeatureFactory.DROPPED_ITEMS) and features:isFeature(gameFeatureFactory.DROPPED_ITEMS_FROM_DEATH) then
            CombatGameCanvas.basicLayerProcessor = java_new_array(nil, 2)
            CombatGameCanvas.basicLayerProcessor[1] = DestroyedLayerProcessor.getInstance()
            CombatGameCanvas.basicLayerProcessor[2] = DropLayerProcessor.getInstance()
        else
            CombatGameCanvas.basicLayerProcessor = java_new_array(nil, 1)
            CombatGameCanvas.basicLayerProcessor[1] = DestroyedLayerProcessor.getInstance()
        end
end


-- throws Exception
function CombatGameCanvas:processPlayingGame()
        AllBinaryGameCanvas.processPlayingGame(self)
        do
            local index = (CombatGameCanvas.basicLayerProcessor.n or #CombatGameCanvas.basicLayerProcessor)
            while (function() index = index - 1 return index end)() >= 0 do
            CombatGameCanvas.basicLayerProcessor[index + 1]:process(self.gameLayerManager)
            end
        end
end


-- throws Exception
function CombatGameCanvas:cleanupGame()
        AllBinaryGameCanvas.cleanupGame(self)
        do
            local index = (CombatGameCanvas.basicLayerProcessor.n or #CombatGameCanvas.basicLayerProcessor)
            while (function() index = index - 1 return index end)() >= 0 do
            CombatGameCanvas.basicLayerProcessor[index + 1]:getList():clear()
            end
        end
        GroupLayerManagerListener.getInstance():clear()
        GroupLayerManagerListener.getInstance():log()
        DestroyedEventHandler.getInstance():removeAllListeners()
        self:cleanupManager()
end


-- throws Exception
function CombatGameCanvas:cleanupManager()
        self.gameLayerManager:cleanup()
end

CombatGameCanvas.basicLayerProcessor = java_new_array(nil, 0)

return CombatGameCanvas

