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
-- package org.allbinary.animation

-- local Enumeration = require("java.util.Enumeration")
local GraphicsStrings = require("org.allbinary.graphics.GraphicsStrings")
local PrimitiveIntUtil = require("org.allbinary.logic.math.PrimitiveIntUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local PositionStrings = require("org.allbinary.math.PositionStrings")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local JSONArray = require("org.json.me.JSONArray")
local JSONException = require("org.json.me.JSONException")
local JSONObject = require("org.json.me.JSONObject")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

local function java_instanceof(object, class)
    local metatable = getmetatable(object)
    while metatable do
        if metatable == class then return true end
        local parent = getmetatable(metatable)
        metatable = parent and parent.__index
    end
    return false
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

local SVGAsJSONSimpleLoader = {}
SVGAsJSONSimpleLoader.__index = SVGAsJSONSimpleLoader
SVGAsJSONSimpleLoader.className = "SVGAsJSONSimpleLoader"

function SVGAsJSONSimpleLoader:_init_fields()
    self.graphicsStrings = GraphicsStrings.getInstance()
    self.shapeTypeFactory = ShapeTypeFactory.getInstance()
    self.KEY_SVG = "svg"
    self.KEY_X1 = "x1"
    self.KEY_Y1 = "y1"
    self.KEY_X2 = "x2"
    self.KEY_Y2 = "y2"
    self.KEY_CX = "cx"
    self.KEY_CY = "cy"
    self.KEY_R = "r"
    self.KEY_X = PositionStrings.getInstance().X
    self.KEY_Y = PositionStrings.getInstance().Y
    self.ERROR_PARSE_SVG_JSON = "Unable to parse SVG JSON"
    self.ERROR_MISSING_KEY_PREFIX = "Missing key: "
    self.ERROR_INVALID_NUMBER_PREFIX = "Invalid number for key: "
    self.ERROR_EXPECTED_OBJECT_PREFIX = "Expected object for: "
    self.EMPTY_POINTS = PrimitiveIntUtil.getTwoDimensionalArrayInstance()
    self.SHAPE_SEPARATOR = {1000, 1000}
    self.CIRCLE_SEGMENTS = 16
end

function SVGAsJSONSimpleLoader.new()
    local self = setmetatable({}, SVGAsJSONSimpleLoader)
    self:_init_fields()
    return self
end


function SVGAsJSONSimpleLoader.getInstance()
        return SVGAsJSONSimpleLoader.instance
end


-- throws Exception
function SVGAsJSONSimpleLoader:load(svgAsJson)
        if svgAsJson == nil then
            return self.EMPTY_POINTS
        end
        local try_ok, try_error = pcall(function()
            local root = JSONObject.new(svgAsJson)
            local svgValue = root:opt(self.KEY_SVG)
            local svg = (function() if svgValue == nil then return root else return self:asObject(svgValue, self.KEY_SVG) end end)()
            local pointVector = BasicArrayListD.new()
            local keys = svg:keys()
            while keys:hasMoreElements() do
                local key = keys:nextElement()
                local value = svg:opt(key)
                if self.shapeTypeFactory.KEY_LINE:equals(key) then
                    self:addShapes(pointVector, value, self.shapeTypeFactory.LINE)
                elseif self.shapeTypeFactory:equals(key) then
                    self:addShapes(pointVector, value, self.shapeTypeFactory.CIRCLE)
                elseif self.shapeTypeFactory.KEY_RECT:equals(key) or self.shapeTypeFactory.KEY_RECTANGLE:equals(key) then
                    self:addShapes(pointVector, value, self.shapeTypeFactory.RECTANGLE)
                end
            end
            return self:toPoints(pointVector)
        end)
        if not try_ok then
            local e = try_error
            error(java_exception("IllegalArgumentException", self.ERROR_PARSE_SVG_JSON, e), 0)
        end
end


-- throws Exception
function SVGAsJSONSimpleLoader:addShapes(pointVector, value, shapeType)
        if java_instanceof(value, JSONArray) then
            local array = value
            local size = array:length()
            for index = 0, size - 1 do
                self:addShape(pointVector, array:opt(index), shapeType)
            end
        else
            self:addShape(pointVector, value, shapeType)
        end
end


-- throws Exception
function SVGAsJSONSimpleLoader:addShape(pointVector, value, shapeType)
        local shape = self:asObject(value, shapeType:getName())
        if shapeType == self.shapeTypeFactory.LINE then
            self:addLine(pointVector, shape)
        elseif shapeType == self.shapeTypeFactory.CIRCLE then
            self:addCircle(pointVector, shape)
        else
            self:addRectangle(pointVector, shape)
        end
end


-- throws Exception
function SVGAsJSONSimpleLoader:addLine(pointVector, line)
        self:addPoint(pointVector, self:readInt(line, self.KEY_X1), self:readInt(line, self.KEY_Y1))
        self:addPoint(pointVector, self:readInt(line, self.KEY_X2), self:readInt(line, self.KEY_Y2))
        self:addSeparator(pointVector)
end


-- throws Exception
function SVGAsJSONSimpleLoader:addCircle(pointVector, circle)
        local cx = self:readInt(circle, self.KEY_CX)
        local cy = self:readInt(circle, self.KEY_CY)
        local radius = self:readInt(circle, self.KEY_R)
        for index = 0, self.CIRCLE_SEGMENTS do
            local angle = (Math.PI * 2.0 * index) / self.CIRCLE_SEGMENTS
            local x = java_int(math.floor(cx + (math.cos(angle) * radius) + 0.5))
            local y = java_int(math.floor(cy + (math.sin(angle) * radius) + 0.5))
            self:addPoint(pointVector, x, y)
        end
        self:addSeparator(pointVector)
end


-- throws Exception
function SVGAsJSONSimpleLoader:addRectangle(pointVector, rectangle)
        local x = self:readInt(rectangle, self.KEY_X, 0)
        local y = self:readInt(rectangle, self.KEY_Y, 0)
        local width = self:readInt(rectangle, self.graphicsStrings.WIDTH)
        local height = self:readInt(rectangle, self.graphicsStrings.HEIGHT)
        self:addPoint(pointVector, x, y)
        self:addPoint(pointVector, x + width, y)
        self:addPoint(pointVector, x + width, y + height)
        self:addPoint(pointVector, x, y + height)
        self:addPoint(pointVector, x, y)
        self:addSeparator(pointVector)
end


function SVGAsJSONSimpleLoader:addPoint(pointVector, x, y)
        pointVector:add({x, y})
end


function SVGAsJSONSimpleLoader:addSeparator(pointVector)
        pointVector:add({self.SHAPE_SEPARATOR[1], self.SHAPE_SEPARATOR[2]})
end


-- throws Exception
function SVGAsJSONSimpleLoader:readInt(anyType, key)
        local value = anyType:get(key)
        if value == nil then
            error(java_exception("IllegalArgumentException", self.ERROR_MISSING_KEY_PREFIX .. key), 0)
        end
        return self:toInt(value, key)
end


-- Java overloaded method: Lua keeps the last definition
function SVGAsJSONSimpleLoader:readInt(anyType, key, defaultValue)
        local try_ok, try_error = pcall(function()
            if anyType:has(key) then
                local value = anyType:get(key)
                return self:toInt(value, key)
            end
        end)
        if not try_ok then
            local e = try_error
            print(debug.traceback(tostring(e)))
        end
        return defaultValue
end


function SVGAsJSONSimpleLoader:toInt(value, key)
        if java_instanceof(value, Number) then
            return java_int(math.floor(((value) + 0.0) + 0.5))
        end
        if java_instanceof(value, String) then
            return java_int(math.floor(tonumber(value) + 0.5))
        end
        error(java_exception("IllegalArgumentException", self.ERROR_INVALID_NUMBER_PREFIX .. key), 0)
end


function SVGAsJSONSimpleLoader:asObject(value, name)
        if java_instanceof(value, JSONObject) then
            return value
        end
        error(java_exception("IllegalArgumentException", self.ERROR_EXPECTED_OBJECT_PREFIX .. name), 0)
end


function SVGAsJSONSimpleLoader:toPoints(pointVector)
        if pointVector:size() == 0 then
            return self.EMPTY_POINTS
        end
        local points = java_new_array(0, pointVector:size(), 2)
        for index = 0, pointVector:size() - 1 do
            local point = pointVector:get(index)
            points[index + 1] = point
        end
        return points
end


-- throws Exception
function SVGAsJSONSimpleLoader.main(args)
        local svgAsJson = "{\"svg\": {\n" .. "    \"rect\": {\n" .. "        \"width\": 20,\n" .. "        \"fill\": \"#008c00\",\n" .. "        \"height\": 20\n" .. "    },\n" .. "    \"xmlns\": \"http://www.w3.org/2000/svg\",\n" .. "    \"width\": 20,\n" .. "    \"height\": 20\n" .. "}}\n"
        local points = SVGAsJSONSimpleLoader.getInstance():load(svgAsJson)
        local stringBuilder = StringMaker.new()
        local size = (points.n or #points)
        for index = 0, size - 1 do
            local size2 = (points[index + 1].n or #points[index + 1])
            for index2 = 0, size2 - 1 do
                stringBuilder:appendint(java_int(points[index + 1][index2 + 1]))
                stringBuilder:append(CommonSeps.getInstance().COMMA)
            end
        end
        print(tostring(stringBuilder))
end

SVGAsJSONSimpleLoader.instance = SVGAsJSONSimpleLoader.new()

return SVGAsJSONSimpleLoader

