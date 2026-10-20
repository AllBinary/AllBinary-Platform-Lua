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

local GameTypeFactory = require("org.allbinary.game.GameTypeFactory")
local NullPaintable = require("org.allbinary.graphics.paint.NullPaintable")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local DemoGameBehavior = {}
DemoGameBehavior.__index = DemoGameBehavior
DemoGameBehavior.className = "DemoGameBehavior"

function DemoGameBehavior:_init_fields()
    self.logUtil = LogUtil.getInstance()
end

function DemoGameBehavior.new()
    local self = setmetatable({}, DemoGameBehavior)
    self:_init_fields()
    return self
end


function DemoGameBehavior.getInstance()
        return DemoGameBehavior.instance
end


-- throws Exception
function DemoGameBehavior:init()
end


function DemoGameBehavior:pause(allBinaryGameCanvas)
end


function DemoGameBehavior:unPause(allBinaryGameCanvas)
end


-- throws Exception
function DemoGameBehavior:updateTouch(allBinaryGameCanvas)
end


-- throws Exception
function DemoGameBehavior:updateScreenButtonPaintable(allBinaryGameCanvas)
        allBinaryGameCanvas:setTouchPaintableP(NullPaintable.getInstance())
end


-- throws Exception
function DemoGameBehavior:setGameState(allBinaryGameCanvas)
end


function DemoGameBehavior:removeAllGameKeyInputListeners(allBinaryGameCanvas)
end


-- throws Exception
function DemoGameBehavior:updateEndGameProcessor(allBinaryGameCanvas)
end


-- throws Exception
function DemoGameBehavior:buildGame(allBinaryGameCanvas)
end


-- throws Exception
function DemoGameBehavior:run(allBinaryGameCanvas)
        local commonStrings = CommonStrings.getInstance()
        self.logUtil:putF(tostring(GameTypeFactory.getInstance().BOT), self, commonStrings.RUN)
end


-- throws Exception
function DemoGameBehavior:setHighScore(abeClientInformation, allBinaryGameCanvas, name, score, autoSubmit, isLast)
end

DemoGameBehavior.instance = DemoGameBehavior.new()

return DemoGameBehavior

