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
-- package org.allbinary.game.displayable.canvas

local GameAdStateFactory = require("org.allbinary.business.advertisement.GameAdStateFactory")
local GameAdState = require("org.allbinary.game.GameAdState")
local Features = require("org.allbinary.game.configuration.feature.Features")
local CurrentDisplayableFactory = require("org.allbinary.graphics.opengles.CurrentDisplayableFactory")
local OpenGLFeatureFactory = require("org.allbinary.graphics.opengles.OpenGLFeatureFactory")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local DemoGameBehavior = require("org.allbinary.game.displayable.canvas.DemoGameBehavior")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BaseGameBehavior = {}
BaseGameBehavior.__index = BaseGameBehavior
BaseGameBehavior.className = "BaseGameBehavior"
setmetatable(BaseGameBehavior, {__index = DemoGameBehavior})

function BaseGameBehavior.new()
    local self = setmetatable(DemoGameBehavior.new(), BaseGameBehavior)
    return self
end


function BaseGameBehavior.getInstance()
        return BaseGameBehavior.instanceC
end


-- throws Exception
function BaseGameBehavior:init()
        local gameAdState = GameAdStateFactory.getInstance():getCurrentInstance()
        gameAdState:playingAdState()
end


function BaseGameBehavior:pause(allBinaryGameCanvas)
        local features = Features.getInstance()
        if features:isDefault(OpenGLFeatureFactory.getInstance().OPENGL_AS_GAME_THREAD) then
            local currentDisplayableFactory = CurrentDisplayableFactory.getInstance()
            currentDisplayableFactory:setRunnable(allBinaryGameCanvas.gamePauseRunnable)
        end
end


function BaseGameBehavior:unPause(allBinaryGameCanvas)
        if Features.getInstance():isDefault(OpenGLFeatureFactory.getInstance().OPENGL_AS_GAME_THREAD) then
            local currentDisplayableFactory = CurrentDisplayableFactory.getInstance()
            currentDisplayableFactory:setRunnable(allBinaryGameCanvas.gameRunnable)
            currentDisplayableFactory:setDisplayable(allBinaryGameCanvas)
        end
end


-- throws Exception
function BaseGameBehavior:updateTouch(allBinaryGameCanvas)
        allBinaryGameCanvas:updateTouch2()
end


-- throws Exception
function BaseGameBehavior:updateScreenButtonPaintable(allBinaryGameCanvas)
        allBinaryGameCanvas:updateScreenButtonPaintable2()
end


-- throws Exception
function BaseGameBehavior:setGameState(allBinaryGameCanvas)
        allBinaryGameCanvas:updateGameState()
end


function BaseGameBehavior:removeAllGameKeyInputListeners(allBinaryGameCanvas)
        allBinaryGameCanvas:removeAllGameKeyInputListeners2()
end


-- throws Exception
function BaseGameBehavior:updateEndGameProcessor(allBinaryGameCanvas)
        allBinaryGameCanvas:updateEndGameProcessor2()
end


-- throws Exception
function BaseGameBehavior:buildGame(allBinaryGameCanvas)
        allBinaryGameCanvas:buildGame2()
end


-- throws Exception
function BaseGameBehavior:run(allBinaryGameCanvas)
        allBinaryGameCanvas:run2()
end


-- throws Exception
function BaseGameBehavior:setHighScore(abeClientInformation, allBinaryGameCanvas, name, score, autoSubmit, isLast)
        allBinaryGameCanvas:setHighScore2(abeClientInformation, name, score, autoSubmit, isLast)
end

BaseGameBehavior.instanceC = BaseGameBehavior.new()

return BaseGameBehavior

