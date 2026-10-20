-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2007 AllBinary 
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
-- package org.allbinary.input.motion.button

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local BaseTouchInput = require("org.allbinary.input.motion.button.BaseTouchInput")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TouchButtonsListBuilder = {}
TouchButtonsListBuilder.__index = TouchButtonsListBuilder
TouchButtonsListBuilder.className = "TouchButtonsListBuilder"
setmetatable(TouchButtonsListBuilder, {__index = BaseTouchInput})

function TouchButtonsListBuilder:_init_fields()
    self.baseTouchInputList = BasicArrayListD.new()
end

function TouchButtonsListBuilder.new()
    local self = setmetatable(BaseTouchInput.new(), TouchButtonsListBuilder)
    self:_init_fields()
    return self
end


function TouchButtonsListBuilder:addList(list)
        local size = self.baseTouchInputList:size()
        local baseTouchInput = nil
        for index = 0, size - 1 do
            baseTouchInput = self.baseTouchInputList:get(index)
            list:addAllList(baseTouchInput:getList())
        end
end


function TouchButtonsListBuilder:add(baseTouchInput)
        self.baseTouchInputList:add(baseTouchInput)
end

return TouchButtonsListBuilder

