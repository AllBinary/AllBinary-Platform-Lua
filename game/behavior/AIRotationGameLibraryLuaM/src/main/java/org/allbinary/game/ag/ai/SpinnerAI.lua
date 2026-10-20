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
-- package org.allbinary.game.ag.ai

-- local Canvas = require("javax.microedition.lcdui.Canvas")
local BasicAI = require("org.allbinary.game.ai.BasicAI")
local GameInput = require("org.allbinary.game.input.GameInput")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local SpinnerAI = {}
SpinnerAI.__index = SpinnerAI
SpinnerAI.className = "SpinnerAI"
setmetatable(SpinnerAI, {__index = BasicAI})

function SpinnerAI:_init_fields()
    self.isEven = false
    self.direction = nil
end


function SpinnerAI.new(direction, ownerLayerInterface, gameInput)
    local self = setmetatable(BasicAI.new(ownerLayerInterface, gameInput), SpinnerAI)
    self:_init_fields()
        -- super(...) made self above
        self.direction = direction
    return self
end


-- throws Exception
function SpinnerAI:processAI(allBinaryLayerManager)
        if self.isEven then
            BasicAI.processKeyAI(self, self.direction[1])
            self.isEven = false
        else
            BasicAI.processKeyAI(self, Canvas.KEY_NUM1)
            self.isEven = true
        end
end

return SpinnerAI

