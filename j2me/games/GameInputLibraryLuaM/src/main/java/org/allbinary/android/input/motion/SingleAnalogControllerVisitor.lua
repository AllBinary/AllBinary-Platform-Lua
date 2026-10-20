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
-- package org.allbinary.android.input.motion

local AnalogLocationInput = require("org.allbinary.game.input.analog.AnalogLocationInput")
local AnalogLocationInputFactory = require("org.allbinary.game.input.analog.AnalogLocationInputFactory")
local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")
local AnalogControllerVisitor = require("org.allbinary.android.input.motion.AnalogControllerVisitor")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local SingleAnalogControllerVisitor = {}
SingleAnalogControllerVisitor.__index = SingleAnalogControllerVisitor
SingleAnalogControllerVisitor.className = "SingleAnalogControllerVisitor"
setmetatable(SingleAnalogControllerVisitor, {__index = AnalogControllerVisitor})

function SingleAnalogControllerVisitor:_init_fields()
    self.playerInputId = nil
end


function SingleAnalogControllerVisitor.new(playerInputId)
    local self = setmetatable(AnalogControllerVisitor.new(), SingleAnalogControllerVisitor)
    self:_init_fields()
        self.playerInputId = playerInputId
    return self
end


function SingleAnalogControllerVisitor:process(allbinaryLayerManager, analogLocationInputProcessor)
        local analogLocationInput = AnalogLocationInputFactory.getInstance():getInstanceForPlayer(self.playerInputId)
        analogLocationInputProcessor:process(allbinaryLayerManager, analogLocationInput)
end

return SingleAnalogControllerVisitor

