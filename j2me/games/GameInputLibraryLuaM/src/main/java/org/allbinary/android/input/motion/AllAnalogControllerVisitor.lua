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
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
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

local AllAnalogControllerVisitor = {}
AllAnalogControllerVisitor.__index = AllAnalogControllerVisitor
AllAnalogControllerVisitor.className = "AllAnalogControllerVisitor"
setmetatable(AllAnalogControllerVisitor, {__index = AnalogControllerVisitor})

function AllAnalogControllerVisitor.new()
    local self = setmetatable(AnalogControllerVisitor.new(), AllAnalogControllerVisitor)
    return self
end


function AllAnalogControllerVisitor:process(allbinaryLayerManager, analogLocationInputProcessor)
        local analogLocationInputList = AnalogLocationInputFactory.getInstance():getList()
        local analogLocationInput = nil
        for index = analogLocationInputList:size() - 1, 0, -1 do
            analogLocationInput = analogLocationInputList:get(index)
            analogLocationInputProcessor:process(allbinaryLayerManager, analogLocationInput)
        end
end

return AllAnalogControllerVisitor

