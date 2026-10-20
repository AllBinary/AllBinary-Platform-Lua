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
-- package org.allbinary.game.ag.ai.tactical

-- local Canvas = require("javax.microedition.lcdui.Canvas")
local BasicAI = require("org.allbinary.game.ai.BasicAI")
local InputProbability = require("org.allbinary.game.ag.ai.InputProbability")
local GameInput = require("org.allbinary.game.input.GameInput")
local MyRandomFactory = require("org.allbinary.game.rand.MyRandomFactory")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")
local Visitor = require("org.allbinary.logic.util.visitor.Visitor")
local GameTickTimeDelayHelperFactory = require("org.allbinary.time.GameTickTimeDelayHelperFactory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BasicRandomAI = {}
BasicRandomAI.__index = BasicRandomAI
BasicRandomAI.className = "BasicRandomAI"
setmetatable(BasicRandomAI, {__index = BasicAI})

function BasicRandomAI:_init_fields()
    self.i_random = 0
    self.inputProbability = nil
    self.visitor = nil
    self.keyArray = {Canvas.UP, Canvas.DOWN, Canvas.LEFT, Canvas.RIGHT, Canvas.KEY_NUM1, Canvas.KEY_NUM7, Canvas.KEY_NUM9}
    self.myRandomFactory = MyRandomFactory.getInstance()
end


function BasicRandomAI.new(ownerLayerInterface, gameInput, inputProbability, visitor)
    local self = setmetatable(BasicAI.new(ownerLayerInterface, gameInput), BasicRandomAI)
    self:_init_fields()
        -- super(...) made self above
        self.inputProbability = inputProbability
        self.visitor = visitor
    return self
end


-- throws Exception
function BasicRandomAI:processAI(allBinaryLayerManager)
        if self.inputProbability:getTimeDelayHelper():isTime(GameTickTimeDelayHelperFactory.getInstance().startTime) then
            self.i_random = self.myRandomFactory:getAbsoluteNextInt(self.inputProbability:getMax())
            local repeat_ = false
            local repeatLikelyhoodIntegerArray = self.inputProbability:getRepeatLikelyhoodIntegerArray()
            if self:getLastKey() ~= -1 and math.tointeger(repeatLikelyhoodIntegerArray[self:getLastKey() + 1] // 1) >= self.i_random then
                repeat_ = true
            end
            if not repeat_ then
                local likelyhoodIntegerArray = self.inputProbability:getLikelyhoodIntegerArray()
                self.i_random = self.myRandomFactory:getAbsoluteNextInt(self.inputProbability:getMax())
                local size = (self.keyArray.n or #self.keyArray)
                local likelyhoodIntegerKeyArray = nil
                for index = 0, size - 1 do
                    local key = self.keyArray[index + 1]
                    likelyhoodIntegerKeyArray = likelyhoodIntegerArray[key + 1]
                    if (likelyhoodIntegerArray.n or #likelyhoodIntegerArray) >= key and likelyhoodIntegerKeyArray[1] ~= nil then
                        if self.i_random >= math.tointeger(likelyhoodIntegerKeyArray[1] // 1) and self.i_random < math.tointeger(likelyhoodIntegerKeyArray[2] // 1) then
                            self:setLastKey(key)
                            break
                        end
                    end
                end
            end
            self.visitor:visit(self)
        end
end

return BasicRandomAI

