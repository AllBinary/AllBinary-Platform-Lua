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
-- package org.allbinary.media.graphics.geography.map

-- local Font = require("javax.microedition.lcdui.Font")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local BooleanFactory = require("org.allbinary.logic.java.bool.BooleanFactory")
local Animation = require("org.allbinary.animation.Animation")
local AnimationBehavior = require("org.allbinary.animation.AnimationBehavior")
local TextAnimation = require("org.allbinary.animation.text.TextAnimation")
local AllBinaryTiledLayer = require("org.allbinary.game.layer.AllBinaryTiledLayer")
local GPoint = require("org.allbinary.graphics.GPoint")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local MyFontProcessor = require("org.allbinary.graphics.font.MyFontProcessor")
local UpdateMyFontInterface = require("org.allbinary.graphics.font.UpdateMyFontInterface")
local UpdateMyFontProcessor = require("org.allbinary.graphics.font.UpdateMyFontProcessor")
local BasicDecimal = require("org.allbinary.logic.math.BasicDecimal")

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

local GeographicMapCellHistory = {}
GeographicMapCellHistory.__index = GeographicMapCellHistory
GeographicMapCellHistory.className = "GeographicMapCellHistory"

function GeographicMapCellHistory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.booleanFactory = BooleanFactory.getInstance()
    self.list = nil
    self.visitedList = nil
    self.MISSED_INFO = "Missed"
    self.animation = TextAnimation.new(self.MISSED_INFO, AnimationBehavior.getInstance())
    self.myFontProcessor = UpdateMyFontProcessor.new(self)
    self.totalVisited = 0
    self.halfWidth = 0
    self.fontHeight = 0
    self.RED = math.tointeger(BasicColorFactory.getInstance().RED // 1)
end


function GeographicMapCellHistory.new()
    local self = setmetatable({}, GeographicMapCellHistory)
    self:_init_fields()
        self.list = BasicArrayListD.new()
        self.visitedList = BasicArrayListD.new()
        self:init()
    return self
end


function GeographicMapCellHistory:updateMeasurement(graphics)
        local font = graphics:getFont()
        self.fontHeight = font:getHeight()
        self.myFontProcessor = MyFontProcessor.getInstance()
end


function GeographicMapCellHistory:getTotalVisited()
        return self.totalVisited
end


function GeographicMapCellHistory:getTotalNotVisited()
        return self:getSize() - self.totalVisited
end


function GeographicMapCellHistory:getSize()
        return self.list:size()
end


function GeographicMapCellHistory:trackAll(list)
        local size = list:size()
        self.list:ensureCapacity(size)
        self.visitedList:ensureCapacity(size)
        local geographicMapCellPosition = nil
        for index = 0, size - 1 do
            geographicMapCellPosition = list:get(index)
            self:track(geographicMapCellPosition)
        end
end


function GeographicMapCellHistory:track(geographicMapCellPosition)
        if not self.list:contains(geographicMapCellPosition) then
            self.list:add(geographicMapCellPosition)
            self.visitedList:add(self.booleanFactory.FALSE)
        end
end


function GeographicMapCellHistory:getTracked()
        return self.list
end


function GeographicMapCellHistory:getVisited()
        return self.visitedList
end


function GeographicMapCellHistory:getAfterIfNotLast(geographicMapCellPosition)
        local localList = self.list
        local index = localList:indexOf(geographicMapCellPosition)
        if localList:size() > index + 1 then
            return localList:get(index + 1)
        end
        return geographicMapCellPosition
end


function GeographicMapCellHistory:getFirstUnvisited()
        local localList = self.list
        local localVisitedList = self.visitedList
        local size = localVisitedList:size()
        local value = nil
        for index = 0, size - 1 do
            value = self.visitedList:get(index)
            if value == self.booleanFactory.FALSE then
                return localList:get(index)
            end
        end
        return localList:get(0)
end


function GeographicMapCellHistory:getFirstUnvisitedIndex()
        local localVisitedList = self.visitedList
        local size = localVisitedList:size()
        local value = nil
        for index = 0, size - 1 do
            value = self.visitedList:get(index)
            if value == self.booleanFactory.FALSE then
                return index
            end
        end
        return 0
end


function GeographicMapCellHistory:getInPathButNotTracked(pathList)
        local inPathButNotTrackedList = BasicArrayListD.new()
        local localList = self.list
        local size = pathList:size()
        local geographicMapCellPosition = nil
        for index = 0, size - 1 do
            geographicMapCellPosition = pathList:get(index)
            if not localList:contains(geographicMapCellPosition) then
                inPathButNotTrackedList:add(geographicMapCellPosition)
            end
        end
        return inPathButNotTrackedList
end


function GeographicMapCellHistory:isVisited(geographicMapCellPosition)
        local index = self.list:indexOf(geographicMapCellPosition)
        if index ~= -1 then
            local value = self.visitedList:get(index)
            if value == self.booleanFactory.TRUE then
                return true
            end
        else
        end
        return false
end


function GeographicMapCellHistory:visit(geographicMapCellPosition)
        local index = self.list:indexOf(geographicMapCellPosition)
        local value = nil
        if index ~= -1 then
            value = self.visitedList:get(index)
            local TRUE = self.booleanFactory.TRUE
            if value ~= TRUE then
                self.visitedList:set(index, TRUE)
                self.totalVisited = self.totalVisited + 1
                return true
            end
        else
        end
        return false
end


-- throws Exception
function GeographicMapCellHistory:isAllVisited()
        if self.totalVisited == self:getSize() - 1 then
            return true
        else
            return false
        end
end


-- throws Exception
function GeographicMapCellHistory:isAllVisited2()
        if self.totalVisited == self:getSize() then
            return true
        else
            return false
        end
end


-- throws Exception
function GeographicMapCellHistory:isPortionVisited(basicDecimal)
        local size = self:getSize()
        local numberRequired = java_idiv((size << basicDecimal:getScaledFactor()), java_int(basicDecimal:getUnscaled()))
        local numberNotVisited = self:getSize() - 1 - self.totalVisited
        if size - numberNotVisited > numberRequired then
            return true
        else
            return false
        end
end


-- throws Exception
function GeographicMapCellHistory:reset()
        local localVisitedList = self.visitedList
        local localFalseBoolean = self.booleanFactory.FALSE
        local size = localVisitedList:size()
        for index = size - 1, 0, -1 do
            localVisitedList:set(index, localFalseBoolean)
        end
        self.totalVisited = 0
end


function GeographicMapCellHistory:paintNotVisitedRelativeToPoint(graphics, tiledLayer, point)
        local x = point:getX() - tiledLayer:getXP()
        local y = point:getY() - tiledLayer:getYP()
        if self.halfWidth == 0 then
            self.halfWidth = (((graphics:getFont():stringWidth(self.MISSED_INFO)) // (1 << (1))))
        end
        local height = 2 * self.fontHeight
        self.animation:paintXY(graphics, x + self.halfWidth, y + (height))
end


function GeographicMapCellHistory:paintNotVisited(graphics, geographicMapInterface)
        local try_ok, try_error = pcall(function()
            self.myFontProcessor:process(graphics)
            graphics:setColor(self.RED)
            local localVisitedList = self.visitedList
            local size = localVisitedList:size()
            local geographicMapCellPosition = nil
            local isCellVisitedBoolean = nil
            do
                local index = size
                while (function() index = index - 1 return index end)() >= 0 do
                geographicMapCellPosition = self.list:get(index)
                isCellVisitedBoolean = localVisitedList:get(index)
                if not isCellVisitedBoolean then
                    self:paintNotVisitedRelativeToPoint(graphics, geographicMapInterface:getAllBinaryTiledLayer(), geographicMapCellPosition:getPoint())
                end
                end
            end
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, "paintNotVisited", e)
        end
end


function GeographicMapCellHistory:init()
        self.list:clear()
        self.visitedList:clear()
        self.totalVisited = 0
end

GeographicMapCellHistory.NULL_GEOGRPAHIC_MAP_HISTORY_ARRAY = java_new_array(nil, 0)

return GeographicMapCellHistory

