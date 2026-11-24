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
-- package org.allbinary.graphics.j2me.workarea.tools

local PointsDomUtil = {}
package.loaded["org.allbinary.graphics.j2me.workarea.tools.PointsDomUtil"] = PointsDomUtil

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

local GPoint = java_lazy("org.allbinary.graphics.GPoint")
local PointFactory = java_lazy("org.allbinary.graphics.PointFactory")
local WorkAreaJPanel = java_lazy("org.allbinary.graphics.j2me.workarea.WorkAreaJPanel")
local CanvasDom = java_lazy("org.allbinary.graphics.j2me.workarea.canvas.CanvasDom")
local PositionStrings = java_lazy("org.allbinary.math.PositionStrings")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local Node = java_lazy("org.w3c.dom.Node")
local Document = java_lazy("org.w3c.dom.Document")
local PointsUtil = java_lazy("org.allbinary.graphics.j2me.workarea.tools.PointsUtil")

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

-- class table PointsDomUtil is declared before the requires
PointsDomUtil.__index = PointsDomUtil
PointsDomUtil.className = "PointsDomUtil"
PointsDomUtil.javaClassName = "org.allbinary.graphics.j2me.workarea.tools.PointsDomUtil"

function PointsDomUtil:_init_fields()
    self.LINES = "lines"
    self.POINTONE = "pointOne"
    self.POINTTWO = "pointTwo"
    self.ROTATEDPOINTONE = "rotatedPointOne"
    self.ROTATEDPOINTTWO = "rotatedPointTwo"
    self.LINE = "line"
end

function PointsDomUtil._jinit(self)
    PointsDomUtil._init_fields(self)
    return self
end

function PointsDomUtil.new()
    return PointsDomUtil._jinit(setmetatable({}, PointsDomUtil))
end


function PointsDomUtil.getInstance()
        return PointsDomUtil.instance_f
end


-- throws Exception
function PointsDomUtil:toDom(canvasDom, pointVector)
        local tempPointVector = PointsUtil.getInstance():doTransforms(pointVector, canvasDom:getAngle(), PointFactory.getInstance():createXY(canvasDom:getDimension():getWidth(), canvasDom:getDimension():getHeight()))
        local document = WorkAreaJPanel.getDocument()
        local linesNode = document:createElement(self.LINES)
        local size2 = tempPointVector:size()
        local size = pointVector:size()
        local firstPoint = nil
        local rotatedFirstPoint = nil
        local index = 0
        if index < size and index < size2 then
            rotatedFirstPoint = tempPointVector:get(index)
            firstPoint = pointVector:get(index)
            index = index + 1
        end
        while index < size and index < size2 do
            local lineNode = document:createElement(self.LINE)
            local rotatedSecondPoint = tempPointVector:get(index)
            local secondPoint = pointVector:get(index)
            local pointOneNode = self:getPointNode(firstPoint, self.POINTONE)
            local pointTwoNode = self:getPointNode(secondPoint, self.POINTTWO)
            local rotatedPointOneNode = self:getPointNode(rotatedFirstPoint, self.ROTATEDPOINTONE)
            local rotatedPointTwoNode = self:getPointNode(rotatedSecondPoint, self.ROTATEDPOINTTWO)
            lineNode:appendChild(pointOneNode)
            lineNode:appendChild(pointTwoNode)
            lineNode:appendChild(rotatedPointOneNode)
            lineNode:appendChild(rotatedPointTwoNode)
            firstPoint = secondPoint
            rotatedFirstPoint = rotatedSecondPoint
            linesNode:appendChild(lineNode)
            index = index + 1
        end
        return linesNode
end


function PointsDomUtil:getPointNode(point, pointName)
        local document = WorkAreaJPanel.getDocument()
        local pointNode = document:createElement(pointName)
        local xNode = document:createElement(PositionStrings.getInstance().X)
        local xTextNode = document:createTextNode(tostring(point:getX()))
        xNode:appendChild(xTextNode)
        local yNode = document:createElement(PositionStrings.getInstance().Y)
        local yTextNode = document:createTextNode(tostring(point:getY()))
        yNode:appendChild(yTextNode)
        pointNode:appendChild(xNode)
        pointNode:appendChild(yNode)
        return pointNode
end

PointsDomUtil.instance_f = PointsDomUtil.new()

return PointsDomUtil

