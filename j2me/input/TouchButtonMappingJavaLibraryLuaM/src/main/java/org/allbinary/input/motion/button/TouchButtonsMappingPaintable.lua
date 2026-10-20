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

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local CellPositionFactory = require("org.allbinary.graphics.CellPositionFactory")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local Paintable = require("org.allbinary.graphics.paint.Paintable")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TouchButtonsMappingPaintable = {}
TouchButtonsMappingPaintable.__index = TouchButtonsMappingPaintable
TouchButtonsMappingPaintable.className = "TouchButtonsMappingPaintable"
setmetatable(TouchButtonsMappingPaintable, {__index = Paintable})

function TouchButtonsMappingPaintable:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.foregroundColor = nil
    self.paintableTable = java_new_array(nil, 0, 0)
    self.touchButtonLocationHelper = TouchButtonLocationHelper.new()
end


function TouchButtonsMappingPaintable.new(basicColor)
    local self = setmetatable(Paintable.new(), TouchButtonsMappingPaintable)
    self:_init_fields()
        self.foregroundColor = math.tointeger(basicColor // 1)
        self:init()
    return self
end


function TouchButtonsMappingPaintable:init()
        local try_ok, try_error = pcall(function()
            self.paintableTable = self:createPaintableTable()
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, "updateRectangle", e)
        end
end


-- throws Exception
function TouchButtonsMappingPaintable:createPaintableTable()
        local totalColumns = self.touchButtonLocationHelper:getTotalColumns()
        local totalRows = self.touchButtonLocationHelper:getTotalRows()
        local paintableTable = java_new_array(nil, totalColumns, totalRows)
        local cellPositionFactory = CellPositionFactory.getInstance()
        local commonButtons = CommonButtons.getInstance()
        for index = totalColumns - 1, 0, -1 do
            for rowIndex = totalRows - 1, 0, -1 do
                self.paintableTable[index + 1][rowIndex + 1] = TouchButton.createButton(BasicTouchInputFactory.getInstance().NONE, TouchButtonBlankResource.getInstance(), commonButtons.NORMAL_BUTTON, cellPositionFactory:getInstanceColRow(index, rowIndex), self.touchButtonLocationHelper:getColumnsRemainderHalf(), self.touchButtonLocationHelper:getRowsRemainderHalf())
            end
        end
        return paintableTable
end


function TouchButtonsMappingPaintable:paint(graphics)
        local totalColumns = self.touchButtonLocationHelper:getTotalColumns()
        local totalRows = self.touchButtonLocationHelper:getTotalRows()
        for index = totalColumns - 1, 0, -1 do
            for rowIndex = totalRows - 1, 0, -1 do
                self.paintableTable[index + 1][rowIndex + 1]:paint(graphics)
            end
        end
end

return TouchButtonsMappingPaintable

