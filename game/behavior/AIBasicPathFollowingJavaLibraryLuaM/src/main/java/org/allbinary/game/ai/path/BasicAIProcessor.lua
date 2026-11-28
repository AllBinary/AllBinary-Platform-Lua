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
-- package org.allbinary.game.ai.path

local BasicAIProcessor = {}
package.loaded["org.allbinary.game.ai.path.BasicAIProcessor"] = BasicAIProcessor

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

local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local Direction = java_lazy("org.allbinary.direction.Direction")
local DirectionFactory = java_lazy("org.allbinary.direction.DirectionFactory")
local AllBinaryLayerManager = java_lazy("org.allbinary.layer.AllBinaryLayerManager")
local AngleInfo = java_lazy("org.allbinary.math.AngleInfo")
local GeographicMapCellHistory = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellHistory")
local GeographicMapCellPosition = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local GeographicMapDirectionUtil = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapDirectionUtil")
local GeographicMapCellPathHistoryInfo = java_lazy("org.allbinary.media.graphics.geography.pathfinding.GeographicMapCellPathHistoryInfo")
local BasicDirectionAIHelper = java_lazy("org.allbinary.game.ai.path.BasicDirectionAIHelper")

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

-- class table BasicAIProcessor is declared before the requires
BasicAIProcessor.__index = BasicAIProcessor
BasicAIProcessor.className = "BasicAIProcessor"
BasicAIProcessor.javaClassName = "org.allbinary.game.ai.path.BasicAIProcessor"

function BasicAIProcessor:_init_fields()
    if self.name_f == nil then self.name_f = nil end
    if self.geographicMapCellHistory == nil then self.geographicMapCellHistory = nil end
    if self.geographicMapCellPositionBasicArrayList == nil then self.geographicMapCellPositionBasicArrayList = nil end
    if self.geographicMapCellPathHistoryInfo == nil then self.geographicMapCellPathHistoryInfo = nil end
    if self.basicAI == nil then self.basicAI = nil end
    self.geographicMapDirectionUtil = GeographicMapDirectionUtil.getInstance()
end


function BasicAIProcessor._jinit(self, name, geographicMapCellHistory, geographicMapCellPathHistoryInfo, chosenPathList, angleInfo, seed)
    BasicAIProcessor._init_fields(self)
        self.name_f = name
        self.geographicMapCellHistory = geographicMapCellHistory
        self.geographicMapCellPositionBasicArrayList = chosenPathList
        self.geographicMapCellPathHistoryInfo = geographicMapCellPathHistoryInfo
        self:setName(name)
        self:setNewPath(geographicMapCellHistory, chosenPathList)
        self.basicAI = BasicDirectionAIHelper.new(self:getName(), angleInfo)
    return self
end

function BasicAIProcessor.new(...)
    local self = setmetatable({}, BasicAIProcessor)
    BasicAIProcessor._jinit(self, ...)
    return self
end


function BasicAIProcessor:setNewPath(geographicMapCellHistory, chosenPathList)
        self:setGeographicMapCellHistory(geographicMapCellHistory)
        self.geographicMapCellPositionBasicArrayList = chosenPathList
        self:init()
end


function BasicAIProcessor:init()
        self.geographicMapCellPathHistoryInfo = GeographicMapCellPathHistoryInfo.new()
        self.geographicMapCellPathHistoryInfo:setPreviousOnPathGeographicMapCellPosition(self.geographicMapCellPositionBasicArrayList:get(self.geographicMapCellPositionBasicArrayList:size() - 1))
        self.geographicMapCellPathHistoryInfo:setNextOnPathGeographicMapCellPosition(self.geographicMapCellPositionBasicArrayList:get(self.geographicMapCellPositionBasicArrayList:size() - 1))
        self:update()
end


-- throws Exception
function BasicAIProcessor:goTowardNextChosenOnPathPosition(currentGeographicMapCellPosition)
        local keyDirection = -1
        local goToGeographicMapCellPosition = self.geographicMapCellPathHistoryInfo:getNextChosenOnPathGeographicMapCellPosition()
        local geographicMapDirectionData = self.geographicMapDirectionUtil:getDirectionFromCellPositionToAdjacentCellPosition(currentGeographicMapCellPosition, goToGeographicMapCellPosition)
        if rawequal(geographicMapDirectionData, DirectionFactory.getInstance().NOT_BORDERED_WITH) then
            geographicMapDirectionData = self.geographicMapDirectionUtil:getDirectionFromCellPositionToCellPosition(currentGeographicMapCellPosition, goToGeographicMapCellPosition)
        end
        keyDirection = self.basicAI:getAIKeyPressedFromDirection(geographicMapDirectionData)
        return keyDirection
end


function BasicAIProcessor:update()
        self.geographicMapCellPathHistoryInfo:setNextUnvisitedOnPathGeographicMapCellPosition(self:getGeographicMapCellHistory():getFirstUnvisited())
        self.geographicMapCellPathHistoryInfo:setNextChosenOnPathGeographicMapCellPosition(self.geographicMapCellPathHistoryInfo:getNextUnvisitedOnPathGeographicMapCellPosition())
end


-- throws Exception
function BasicAIProcessor:processAI(myManager, currentGeographicMapCellPosition)
        local keyDirection = -1
        if self.geographicMapCellPositionBasicArrayList:contains(currentGeographicMapCellPosition) then
            self:update()
            keyDirection = self:goTowardNextChosenOnPathPosition(currentGeographicMapCellPosition)
            self.geographicMapCellPathHistoryInfo:setPreviousOnPathGeographicMapCellPosition(currentGeographicMapCellPosition)
        else
            keyDirection = self:goTowardNextChosenOnPathPosition(currentGeographicMapCellPosition)
        end
        return keyDirection
end


function BasicAIProcessor:getName()
        return self.name_f
end


function BasicAIProcessor:setName(name)
        self.name_f = name
end


function BasicAIProcessor:getGeographicMapCellPathHistoryInfo()
        return self.geographicMapCellPathHistoryInfo
end


function BasicAIProcessor:setGeographicMapCellPathHistoryInfo(geographicMapCellPathHistoryInfo)
        self.geographicMapCellPathHistoryInfo = geographicMapCellPathHistoryInfo
end


function BasicAIProcessor:getGeographicMapCellHistory()
        return self.geographicMapCellHistory
end


function BasicAIProcessor:setGeographicMapCellHistory(geographicMapCellHistory)
        self.geographicMapCellHistory = geographicMapCellHistory
end

return BasicAIProcessor

