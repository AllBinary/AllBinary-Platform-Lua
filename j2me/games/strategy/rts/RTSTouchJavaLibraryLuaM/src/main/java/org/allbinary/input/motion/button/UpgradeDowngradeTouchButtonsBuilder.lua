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

local TouchButtonDowngradeResource = require("org.allbinary.game.input.resource.TouchButtonDowngradeResource")
local TouchButtonUpgradeResource = require("org.allbinary.game.input.resource.TouchButtonUpgradeResource")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local BasicArrayListUtil = require("org.allbinary.util.BasicArrayListUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CellPositionFactory = require("org.allbinary.graphics.CellPositionFactory")
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

local UpgradeDowngradeTouchButtonsBuilder = {}
UpgradeDowngradeTouchButtonsBuilder.__index = UpgradeDowngradeTouchButtonsBuilder
UpgradeDowngradeTouchButtonsBuilder.className = "UpgradeDowngradeTouchButtonsBuilder"
setmetatable(UpgradeDowngradeTouchButtonsBuilder, {__index = BaseTouchInput})

function UpgradeDowngradeTouchButtonsBuilder:_init_fields()
    self.logUtil = LogUtil.getInstance()
end

function UpgradeDowngradeTouchButtonsBuilder.new()
    local self = setmetatable(BaseTouchInput.new(), UpgradeDowngradeTouchButtonsBuilder)
    self:_init_fields()
    return self
end


function UpgradeDowngradeTouchButtonsBuilder:getList()
        local try_ok, try_error = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
            local list = BasicArrayListD.new()
            local touchButtonLocationHelper = TouchButtonLocationHelper.new()
            local cellPositionFactory = CellPositionFactory.getInstance()
            local basicTouchButtonCellPositionFactory = BasicTouchButtonCellPositionFactory.new()
            if basicTouchButtonCellPositionFactory.SECOND_FROM_TOP_LEFT ~= cellPositionFactory.NONE and basicTouchButtonCellPositionFactory.SECOND_FROM_TOP_RIGHT ~= cellPositionFactory.NONE then
                local commonButtons = CommonButtons.getInstance()
                local UP = TouchButton.createButton(BasicTouchInputFactory.getInstance().SPECIAL_BUTTON_TWO, TouchButtonUpgradeResource.getInstance(), commonButtons.NORMAL_BUTTON, basicTouchButtonCellPositionFactory.SECOND_FROM_TOP_LEFT, touchButtonLocationHelper:getColumnsRemainderHalf(), touchButtonLocationHelper:getRowsRemainderHalf())
                local DOWN = TouchButton.createButton(BasicTouchInputFactory.getInstance().SPECIAL_BUTTON_ONE, TouchButtonDowngradeResource.getInstance(), commonButtons.NORMAL_BUTTON, basicTouchButtonCellPositionFactory.SECOND_FROM_TOP_RIGHT, touchButtonLocationHelper:getColumnsRemainderHalf(), touchButtonLocationHelper:getRowsRemainderHalf())
                list:add(UP)
                list:add(DOWN)
            end
            return list
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.CONSTRUCTOR, e)
            return BasicArrayListUtil.getInstance():getImmutableInstance()
        end
end

return UpgradeDowngradeTouchButtonsBuilder

