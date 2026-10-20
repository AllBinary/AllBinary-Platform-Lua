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
-- package org.allbinary.game.ai

local ArtificialIntelligence = require("org.allbinary.ai.ArtificialIntelligence")
local CanvasUtil = require("org.allbinary.game.displayable.canvas.CanvasUtil")
local GameInput = require("org.allbinary.game.input.GameInput")
local GameKeyEventSourceInterface = require("org.allbinary.game.input.GameKeyEventSourceInterface")
local GameKeyEventFactory = require("org.allbinary.game.input.event.GameKeyEventFactory")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local SmallIntegerSingletonFactory = require("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local CommonStrings = require("org.allbinary.string.CommonStrings")

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

local BasicAI = {}
BasicAI.__index = BasicAI
BasicAI.className = "BasicAI"
setmetatable(BasicAI, {__index = ArtificialIntelligence})

function BasicAI:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.gameKeyEventFactory = GameKeyEventFactory.getInstance()
    self.ownerLayerInterface = nil
    self.gameInput = nil
    self.lastKey = -1
end


function BasicAI.new(ownerLayerInterface, gameInput)
    local self = setmetatable(ArtificialIntelligence.new(), BasicAI)
    self:_init_fields()
        self.ownerLayerInterface = ownerLayerInterface
        self.gameInput = gameInput
    return self
end


-- throws Exception
function BasicAI:processAI(allBinaryLayerManager)
        error(java_exception("Exception", self.commonStrings.NOT_IMPLEMENTED), 0)
end


-- throws Exception
function BasicAI:processKeyAI(key)
        if key ~= -1 then
            self.gameInput:add(self.gameKeyEventFactory:getInstanceForKey(self, key))
        end
end


function BasicAI:setLastKey(lastKey)
        self.lastKey = lastKey
end


function BasicAI:getLastKey()
        return self.lastKey
end


function BasicAI:getOwnerLayerInterface()
        return self.ownerLayerInterface
end


function BasicAI:getGameInput()
        return self.gameInput
end


function BasicAI:getName()
        return getmetatable(self).className
end


function BasicAI:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(CommonSeps.getInstance().NEW_LINE)
        stringBuffer:append(self:getName())
        stringBuffer:append(" LastKey: ")
        stringBuffer:append(CanvasUtil.getKeyName(self:getLastKey()))
        return tostring(stringBuffer)
end
BasicAI.__tostring = function(self) return self:toString() end


function BasicAI:getSourceId()
        return 1
end

BasicAI.AI_VISITOR = SmallIntegerSingletonFactory.getInstance():getAt(2)
BasicAI.ID = SmallIntegerSingletonFactory.getInstance():getAt(1)

return BasicAI

