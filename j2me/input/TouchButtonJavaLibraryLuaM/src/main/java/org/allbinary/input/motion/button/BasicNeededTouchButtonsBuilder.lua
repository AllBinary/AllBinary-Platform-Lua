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
-- package org.allbinary.input.motion.button

local Animation = require("org.allbinary.animation.Animation")
local NullAnimationFactory = require("org.allbinary.animation.NullAnimationFactory")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local BasicArrayListUtil = require("org.allbinary.util.BasicArrayListUtil")
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

local BasicNeededTouchButtonsBuilder = {}
BasicNeededTouchButtonsBuilder.__index = BasicNeededTouchButtonsBuilder
BasicNeededTouchButtonsBuilder.className = "BasicNeededTouchButtonsBuilder"
setmetatable(BasicNeededTouchButtonsBuilder, {__index = BaseTouchInput})

function BasicNeededTouchButtonsBuilder:_init_fields()
    self.logUtil = LogUtil.getInstance()
end

function BasicNeededTouchButtonsBuilder.new()
    local self = setmetatable(BaseTouchInput.new(), BasicNeededTouchButtonsBuilder)
    self:_init_fields()
    return self
end


function BasicNeededTouchButtonsBuilder:getList()
        local try_ok, try_error = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
            local list = BasicArrayListD.new()
            local touchButtonLocationHelper = TouchButtonLocationHelper.new()
            local basicTouchButtonCellPositionFactory = BasicTouchButtonCellPositionFactory.new()
            local commonButtons = CommonButtons.getInstance()
            local animationInterface = NullAnimationFactory.getFactoryInstance():getInstance(0)
            local UP = TouchButton.new(BasicTouchInputFactory.getInstance().UP, animationInterface, animationInterface, commonButtons.NORMAL_BUTTON, basicTouchButtonCellPositionFactory.SECOND_FROM_BOTTOM_LEFT, touchButtonLocationHelper:getColumnsRemainderHalf(), touchButtonLocationHelper:getRowsRemainderHalf())
            local DOWN = TouchButton.new(BasicTouchInputFactory.getInstance().DOWN, animationInterface, animationInterface, commonButtons.NORMAL_BUTTON, basicTouchButtonCellPositionFactory.BOTTOM_LEFT, touchButtonLocationHelper:getColumnsRemainderHalf(), touchButtonLocationHelper:getRowsRemainderHalf())
            local LEFT = TouchButton.new(BasicTouchInputFactory.getInstance().LEFT, animationInterface, animationInterface, commonButtons.NORMAL_BUTTON, basicTouchButtonCellPositionFactory.BOTTOM_SECOND_FROM_RIGHT, touchButtonLocationHelper:getColumnsRemainderHalf(), touchButtonLocationHelper:getRowsRemainderHalf())
            local RIGHT = TouchButton.new(BasicTouchInputFactory.getInstance().RIGHT, animationInterface, animationInterface, commonButtons.NORMAL_BUTTON, basicTouchButtonCellPositionFactory.BOTTOM_RIGHT, touchButtonLocationHelper:getColumnsRemainderHalf(), touchButtonLocationHelper:getRowsRemainderHalf())
            list:add(UP)
            list:add(DOWN)
            list:add(LEFT)
            list:add(RIGHT)
            return list
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.GET_LIST, e)
            return BasicArrayListUtil.getInstance():getImmutableInstance()
        end
end

return BasicNeededTouchButtonsBuilder

