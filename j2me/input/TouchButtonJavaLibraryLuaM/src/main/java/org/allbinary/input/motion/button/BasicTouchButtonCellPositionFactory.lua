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

local CellPosition = require("org.allbinary.graphics.CellPosition")
local CellPositionFactory = require("org.allbinary.graphics.CellPositionFactory")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BasicTouchButtonCellPositionFactory = {}
BasicTouchButtonCellPositionFactory.__index = BasicTouchButtonCellPositionFactory
BasicTouchButtonCellPositionFactory.className = "BasicTouchButtonCellPositionFactory"

function BasicTouchButtonCellPositionFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.TOP_RIGHT = nil
    self.TOP_LEFT = nil
    self.SECOND_FROM_TOP_LEFT = nil
    self.SECOND_FROM_TOP_RIGHT = nil
    self.TOP_SECOND_FROM_LEFT = nil
    self.TOP_SECOND_FROM_RIGHT = nil
    self.BOTTOM_RIGHT = nil
    self.BOTTOM_SECOND_FROM_RIGHT = nil
    self.SECOND_FROM_BOTTOM_RIGHT = nil
    self.THIRD_FROM_BOTTOM_RIGHT = nil
    self.FOURTH_FROM_BOTTOM_RIGHT = nil
    self.SECOND_FROM_BOTTOM_SECOND_FROM_RIGHT = nil
    self.SECOND_FROM_BOTTOM_THIRD_FROM_RIGHT = nil
    self.SECOND_FROM_BOTTOM_FOURTH_FROM_RIGHT = nil
    self.BOTTOM_THIRD_FROM_RIGHT = nil
    self.BOTTOM_FOURTH_FROM_RIGHT = nil
    self.BOTTOM_SECOND_FROM_LEFT = nil
    self.SECOND_FROM_BOTTOM_LEFT = nil
    self.THIRD_FROM_BOTTOM_LEFT = nil
    self.BOTTOM_LEFT = nil
    self.SECOND_FROM_BOTTOM_SECOND_FROM_LEFT = nil
end


function BasicTouchButtonCellPositionFactory.new()
    local self = setmetatable({}, BasicTouchButtonCellPositionFactory)
    self:_init_fields()
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        local touchButtonLocationHelper = TouchButtonLocationHelper.new()
        local cellPositionFactory = CellPositionFactory.getInstance()
        cellPositionFactory:init(touchButtonLocationHelper:getTotalColumns(), touchButtonLocationHelper:getTotalRows())
        self.TOP_LEFT = cellPositionFactory:getInstanceColRow(0, 0)
        self.TOP_RIGHT = cellPositionFactory:getInstanceColRow(touchButtonLocationHelper:getTotalColumns() - 1, 0)
        self.BOTTOM_LEFT = cellPositionFactory:getInstanceColRow(0, touchButtonLocationHelper:getTotalRows() - 1)
        self.BOTTOM_RIGHT = cellPositionFactory:getInstanceColRow(touchButtonLocationHelper:getTotalColumns() - 1, touchButtonLocationHelper:getTotalRows() - 1)
        self.BOTTOM_SECOND_FROM_RIGHT = cellPositionFactory:getInstanceColRow(touchButtonLocationHelper:getTotalColumns() - 2, touchButtonLocationHelper:getTotalRows() - 1)
        self.SECOND_FROM_BOTTOM_RIGHT = cellPositionFactory:getInstanceColRow(touchButtonLocationHelper:getTotalColumns() - 1, touchButtonLocationHelper:getTotalRows() - 2)
        self.SECOND_FROM_BOTTOM_SECOND_FROM_RIGHT = cellPositionFactory:getInstanceColRow(touchButtonLocationHelper:getTotalColumns() - 2, touchButtonLocationHelper:getTotalRows() - 2)
        self.BOTTOM_SECOND_FROM_LEFT = cellPositionFactory:getInstanceColRow(1, touchButtonLocationHelper:getTotalRows() - 1)
        self.SECOND_FROM_BOTTOM_LEFT = cellPositionFactory:getInstanceColRow(0, touchButtonLocationHelper:getTotalRows() - 2)
        self.SECOND_FROM_BOTTOM_SECOND_FROM_LEFT = cellPositionFactory:getInstanceColRow(1, touchButtonLocationHelper:getTotalRows() - 2)
        if touchButtonLocationHelper:getTotalRows() > 2 then
            self.SECOND_FROM_TOP_LEFT = cellPositionFactory:getInstanceColRow(0, 1)
            self.SECOND_FROM_TOP_RIGHT = cellPositionFactory:getInstanceColRow(touchButtonLocationHelper:getTotalColumns() - 1, 1)
        else
            self.SECOND_FROM_TOP_LEFT = cellPositionFactory.NONE
            self.SECOND_FROM_TOP_RIGHT = cellPositionFactory.NONE
        end
        if touchButtonLocationHelper:getTotalRows() >= 4 then
            self.THIRD_FROM_BOTTOM_RIGHT = cellPositionFactory:getInstanceColRow(touchButtonLocationHelper:getTotalColumns() - 1, touchButtonLocationHelper:getTotalRows() - 3)
            self.FOURTH_FROM_BOTTOM_RIGHT = cellPositionFactory:getInstanceColRow(touchButtonLocationHelper:getTotalColumns() - 1, touchButtonLocationHelper:getTotalRows() - 4)
            self.THIRD_FROM_BOTTOM_LEFT = cellPositionFactory:getInstanceColRow(0, touchButtonLocationHelper:getTotalRows() - 3)
        else
            self.THIRD_FROM_BOTTOM_RIGHT = cellPositionFactory.NONE
            self.FOURTH_FROM_BOTTOM_RIGHT = cellPositionFactory.NONE
            self.THIRD_FROM_BOTTOM_LEFT = cellPositionFactory.NONE
        end
        if touchButtonLocationHelper:getTotalColumns() >= 4 then
            self.SECOND_FROM_BOTTOM_THIRD_FROM_RIGHT = cellPositionFactory:getInstanceColRow(touchButtonLocationHelper:getTotalColumns() - 3, touchButtonLocationHelper:getTotalRows() - 2)
            self.SECOND_FROM_BOTTOM_FOURTH_FROM_RIGHT = cellPositionFactory:getInstanceColRow(touchButtonLocationHelper:getTotalColumns() - 4, touchButtonLocationHelper:getTotalRows() - 2)
            self.BOTTOM_THIRD_FROM_RIGHT = cellPositionFactory:getInstanceColRow(touchButtonLocationHelper:getTotalColumns() - 3, touchButtonLocationHelper:getTotalRows() - 1)
            self.BOTTOM_FOURTH_FROM_RIGHT = cellPositionFactory:getInstanceColRow(touchButtonLocationHelper:getTotalColumns() - 4, touchButtonLocationHelper:getTotalRows() - 1)
            self.TOP_SECOND_FROM_LEFT = cellPositionFactory:getInstanceColRow(1, 0)
            self.TOP_SECOND_FROM_RIGHT = cellPositionFactory:getInstanceColRow(touchButtonLocationHelper:getTotalColumns() - 2, 0)
        else
            self.SECOND_FROM_BOTTOM_THIRD_FROM_RIGHT = cellPositionFactory.NONE
            self.SECOND_FROM_BOTTOM_FOURTH_FROM_RIGHT = cellPositionFactory.NONE
            self.BOTTOM_THIRD_FROM_RIGHT = cellPositionFactory.NONE
            self.BOTTOM_FOURTH_FROM_RIGHT = cellPositionFactory.NONE
            self.TOP_SECOND_FROM_LEFT = cellPositionFactory.NONE
            self.TOP_SECOND_FROM_RIGHT = cellPositionFactory.NONE
        end
    return self
end

return BasicTouchButtonCellPositionFactory

