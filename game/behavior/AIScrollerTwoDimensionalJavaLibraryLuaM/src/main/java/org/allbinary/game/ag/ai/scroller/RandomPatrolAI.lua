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
-- package org.allbinary.game.ag.ai.scroller

-- local Canvas = require("javax.microedition.lcdui.Canvas")
local GameInput = require("org.allbinary.game.input.GameInput")
local MyRandomFactory = require("org.allbinary.game.rand.MyRandomFactory")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")
local ABHashtable = require("org.allbinary.util.ABHashtable")
local BasePatrolAI = require("org.allbinary.game.ag.ai.scroller.BasePatrolAI")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local RandomPatrolAI = {}
RandomPatrolAI.__index = RandomPatrolAI
RandomPatrolAI.className = "RandomPatrolAI"
setmetatable(RandomPatrolAI, {__index = BasePatrolAI})

function RandomPatrolAI:_init_fields()
    self.changedDirection = true
end


function RandomPatrolAI.new(hashtable, ownerLayerInterface, gameInput)
    local self = setmetatable(BasePatrolAI.new(hashtable, ownerLayerInterface, gameInput), RandomPatrolAI)
    self:_init_fields()
        -- super(...) made self above
        self:updateRandomDistance()
    return self
end


function RandomPatrolAI:updateRandomDistance()
        self.currentDistance = MyRandomFactory.getInstance():getAbsoluteNextInt(math.tointeger(self.maxDistance // 1))
end


-- throws Exception
function RandomPatrolAI:processAI(allBinaryLayerManager)
        BasePatrolAI.update(self)
        BasePatrolAI.processKeyAI(self, self.keyDirection)
        if self.changedDirection then
            BasePatrolAI.processKeyAI(self, Canvas.KEY_NUM1)
            self:updateRandomDistance()
            self.changedDirection = false
        end
end


function RandomPatrolAI:nextDirection()
        BasePatrolAI.nextDirection(self)
        self.changedDirection = true
end

return RandomPatrolAI

