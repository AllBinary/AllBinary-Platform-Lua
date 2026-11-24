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

local BasicTouchButtonCellPositionFactory = {}
package.loaded["org.allbinary.input.motion.button.BasicTouchButtonCellPositionFactory"] = BasicTouchButtonCellPositionFactory

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local CellPosition = java_lazy("org.allbinary.graphics.CellPosition")
local CellPositionFactory = java_lazy("org.allbinary.graphics.CellPositionFactory")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local TouchButtonLocationHelper = java_lazy("org.allbinary.input.motion.button.TouchButtonLocationHelper")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table BasicTouchButtonCellPositionFactory is declared before the requires
BasicTouchButtonCellPositionFactory.__index = BasicTouchButtonCellPositionFactory
BasicTouchButtonCellPositionFactory.className = "BasicTouchButtonCellPositionFactory"
BasicTouchButtonCellPositionFactory.javaClassName = "org.allbinary.input.motion.button.BasicTouchButtonCellPositionFactory"

function BasicTouchButtonCellPositionFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.TOP_RIGHT == nil then self.TOP_RIGHT = nil end
    if self.TOP_LEFT == nil then self.TOP_LEFT = nil end
    if self.SECOND_FROM_TOP_LEFT == nil then self.SECOND_FROM_TOP_LEFT = nil end
    if self.SECOND_FROM_TOP_RIGHT == nil then self.SECOND_FROM_TOP_RIGHT = nil end
    if self.TOP_SECOND_FROM_LEFT == nil then self.TOP_SECOND_FROM_LEFT = nil end
    if self.TOP_SECOND_FROM_RIGHT == nil then self.TOP_SECOND_FROM_RIGHT = nil end
    if self.BOTTOM_RIGHT == nil then self.BOTTOM_RIGHT = nil end
    if self.BOTTOM_SECOND_FROM_RIGHT == nil then self.BOTTOM_SECOND_FROM_RIGHT = nil end
    if self.SECOND_FROM_BOTTOM_RIGHT == nil then self.SECOND_FROM_BOTTOM_RIGHT = nil end
    if self.THIRD_FROM_BOTTOM_RIGHT == nil then self.THIRD_FROM_BOTTOM_RIGHT = nil end
    if self.FOURTH_FROM_BOTTOM_RIGHT == nil then self.FOURTH_FROM_BOTTOM_RIGHT = nil end
    if self.SECOND_FROM_BOTTOM_SECOND_FROM_RIGHT == nil then self.SECOND_FROM_BOTTOM_SECOND_FROM_RIGHT = nil end
    if self.SECOND_FROM_BOTTOM_THIRD_FROM_RIGHT == nil then self.SECOND_FROM_BOTTOM_THIRD_FROM_RIGHT = nil end
    if self.SECOND_FROM_BOTTOM_FOURTH_FROM_RIGHT == nil then self.SECOND_FROM_BOTTOM_FOURTH_FROM_RIGHT = nil end
    if self.BOTTOM_THIRD_FROM_RIGHT == nil then self.BOTTOM_THIRD_FROM_RIGHT = nil end
    if self.BOTTOM_FOURTH_FROM_RIGHT == nil then self.BOTTOM_FOURTH_FROM_RIGHT = nil end
    if self.BOTTOM_SECOND_FROM_LEFT == nil then self.BOTTOM_SECOND_FROM_LEFT = nil end
    if self.SECOND_FROM_BOTTOM_LEFT == nil then self.SECOND_FROM_BOTTOM_LEFT = nil end
    if self.THIRD_FROM_BOTTOM_LEFT == nil then self.THIRD_FROM_BOTTOM_LEFT = nil end
    if self.BOTTOM_LEFT == nil then self.BOTTOM_LEFT = nil end
    if self.SECOND_FROM_BOTTOM_SECOND_FROM_LEFT == nil then self.SECOND_FROM_BOTTOM_SECOND_FROM_LEFT = nil end
end


function BasicTouchButtonCellPositionFactory._jinit(self)
    BasicTouchButtonCellPositionFactory._init_fields(self)
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

function BasicTouchButtonCellPositionFactory.new(...)
    local self = setmetatable({}, BasicTouchButtonCellPositionFactory)
    BasicTouchButtonCellPositionFactory._jinit(self, ...)
    return self
end

return BasicTouchButtonCellPositionFactory

