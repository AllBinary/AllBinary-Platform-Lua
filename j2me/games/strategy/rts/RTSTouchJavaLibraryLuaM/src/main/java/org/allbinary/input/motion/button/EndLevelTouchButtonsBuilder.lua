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
local BasicArrayListUtil = require("org.allbinary.util.BasicArrayListUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local TouchButtonsListBuilder = require("org.allbinary.input.motion.button.TouchButtonsListBuilder")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local EndLevelTouchButtonsBuilder = {}
EndLevelTouchButtonsBuilder.__index = EndLevelTouchButtonsBuilder
EndLevelTouchButtonsBuilder.className = "EndLevelTouchButtonsBuilder"
setmetatable(EndLevelTouchButtonsBuilder, {__index = TouchButtonsListBuilder})

function EndLevelTouchButtonsBuilder:_init_fields()
    self.logUtil = LogUtil.getInstance()
end

function EndLevelTouchButtonsBuilder.new()
    local self = setmetatable(TouchButtonsListBuilder.new(), EndLevelTouchButtonsBuilder)
    self:_init_fields()
    return self
end


function EndLevelTouchButtonsBuilder:getList()
        local try_ok, try_error = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
            local list = BasicArrayListD.new()
            list:addAllList(BasicTouchButtonsBuilder.new():getList())
            list:addAllList(BuildingScrollTouchButtonsBuilder.new():getList())
            list:addAllList(UpgradeDowngradeTouchButtonsBuilder.new():getList())
            self:addList(list)
            return list
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.CONSTRUCTOR, e)
            return BasicArrayListUtil.getInstance():getImmutableInstance()
        end
end

return EndLevelTouchButtonsBuilder

