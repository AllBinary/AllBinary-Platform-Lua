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

local PreGameScrollSelectionTouchButtonsBuilder = {}
PreGameScrollSelectionTouchButtonsBuilder.__index = PreGameScrollSelectionTouchButtonsBuilder
PreGameScrollSelectionTouchButtonsBuilder.className = "PreGameScrollSelectionTouchButtonsBuilder"
setmetatable(PreGameScrollSelectionTouchButtonsBuilder, {__index = BaseTouchInput})

function PreGameScrollSelectionTouchButtonsBuilder:_init_fields()
    self.logUtil = LogUtil.getInstance()
end

function PreGameScrollSelectionTouchButtonsBuilder.new()
    local self = setmetatable(BaseTouchInput.new(), PreGameScrollSelectionTouchButtonsBuilder)
    self:_init_fields()
    return self
end


function PreGameScrollSelectionTouchButtonsBuilder:getList()
        local try_ok, try_error = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.GET_LIST)
            local list = BasicArrayListD.new()
            local touchButtonLocationHelper = TouchButtonLocationHelper.new()
            local commonButtons = CommonButtons.getInstance()
            local basicTouchButtonCellPositionFactory = BasicTouchButtonCellPositionFactory.new()
            local LEFT = TouchButton.createButton(BasicTouchInputFactory.getInstance().LEFT, TouchButtonStrafeLeftResource.getInstance(), commonButtons.NORMAL_BUTTON, basicTouchButtonCellPositionFactory.TOP_LEFT, touchButtonLocationHelper:getColumnsRemainderHalf(), touchButtonLocationHelper:getRowsRemainderHalf())
            local RIGHT = TouchButton.createButton(BasicTouchInputFactory.getInstance().RIGHT, TouchButtonStrafeRightResource.getInstance(), commonButtons.NORMAL_BUTTON, basicTouchButtonCellPositionFactory.TOP_RIGHT, touchButtonLocationHelper:getColumnsRemainderHalf(), touchButtonLocationHelper:getRowsRemainderHalf())
            local START = TouchButton.createButton(BasicTouchInputFactory.getInstance().SPECIAL_BUTTON_FIVE, TouchButtonStartResource.getInstance(), commonButtons.NORMAL_BUTTON, basicTouchButtonCellPositionFactory.BOTTOM_RIGHT, touchButtonLocationHelper:getColumnsRemainderHalf(), touchButtonLocationHelper:getRowsRemainderHalf())
            list:add(LEFT)
            list:add(RIGHT)
            list:add(START)
            return list
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.GET_LIST, e)
            return BasicArrayListUtil.getInstance():getImmutableInstance()
        end
end

return PreGameScrollSelectionTouchButtonsBuilder

