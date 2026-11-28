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

local SVGAsJSONSimpleLoader = {}
package.loaded["org.allbinary.animation.SVGAsJSONSimpleLoader"] = SVGAsJSONSimpleLoader

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

local GraphicsStrings = java_lazy("org.allbinary.graphics.GraphicsStrings")
local PrimitiveIntUtil = java_lazy("org.allbinary.logic.math.PrimitiveIntUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local PositionStrings = java_lazy("org.allbinary.math.PositionStrings")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local JSONArray = java_lazy("org.json.me.JSONArray")
local JSONException = java_lazy("org.json.me.JSONException")
local JSONObject = java_lazy("org.json.me.JSONObject")
local ShapeType = java_lazy("org.allbinary.animation.ShapeType")
local ShapeTypeFactory = java_lazy("org.allbinary.animation.ShapeTypeFactory")

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

-- JNI element code (I, J, S, B, F, D) of a primitive array for the overload type dispatch
local function java_typed_array(code, array)
    array.jt = code
    return array
end

local function java_instanceof(object, class)
    class = java_real(class)
    local metatable = getmetatable(object)
    while metatable do
        if metatable == class then return true end
        local parent = getmetatable(metatable)
        metatable = parent and parent.__index
    end
    return false
end

-- Sub interfaces: the interface tables a class implements (java_interfaces) and the interfaces they extend
local function java_is_interface(interface, name, depth)
    interface = java_real(interface)
    if type(interface) ~= "table" or depth > 32 then return false end
    if rawget(interface, "className") == name then return true end
    local interfaces = rawget(interface, "java_interfaces")
    if interfaces ~= nil then
        for _, each in pairs(interfaces()) do if java_is_interface(each, name, depth + 1) then return true end end
    end
    local parent = getmetatable(interface)
    return parent ~= nil and parent.__index ~= interface and java_is_interface(parent.__index, name, depth + 1)
end

local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    while type(class) == "table" do
        class = java_real(class)
        if rawget(class, "className") == name then return true end
        local implements = rawget(class, "java_implements")
        if implements ~= nil and string.find(implements, " " .. name .. " ", 1, true) then return true end
        local interfaces = rawget(class, "java_interfaces")
        if interfaces ~= nil then
            for _, each in pairs(interfaces()) do if java_is_interface(each, name, 0) then return true end end
        end
        local parent = getmetatable(class)
        if parent ~= nil then class = parent.__index
        else
            local index = rawget(class, "__index")
            if index ~= class then class = index else class = nil end
        end
    end
    return false
end

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

-- class table SVGAsJSONSimpleLoader is declared before the requires
SVGAsJSONSimpleLoader.__index = SVGAsJSONSimpleLoader
SVGAsJSONSimpleLoader.className = "SVGAsJSONSimpleLoader"
SVGAsJSONSimpleLoader.javaClassName = "org.allbinary.animation.SVGAsJSONSimpleLoader"

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
    self.SHAPE_SEPARATOR = {jt = "I", 1000, 1000}
    self.CIRCLE_SEGMENTS = 16
end

function SVGAsJSONSimpleLoader._jinit(self)
    SVGAsJSONSimpleLoader._init_fields(self)
    return self
end

function SVGAsJSONSimpleLoader.new()
    return SVGAsJSONSimpleLoader._jinit(setmetatable({}, SVGAsJSONSimpleLoader))
end


function SVGAsJSONSimpleLoader.getInstance()
        return SVGAsJSONSimpleLoader.instance_f
end


-- throws Exception
function SVGAsJSONSimpleLoader:load(svgAsJson)
        if rawequal(svgAsJson, nil) then
            return self.EMPTY_POINTS
        end
        local try_ok, try_error, try_value = pcall(function()
            local root = JSONObject.new(svgAsJson)
            local svgValue = root:opt(self.KEY_SVG)
            local svg = (function() if rawequal(svgValue, nil) then return root else return self:asObject(svgValue, self.KEY_SVG) end end)()
            local pointVector = BasicArrayListD.new()
            local objectArray = svg:keysAsArray()
            local size = (objectArray.n or #objectArray)
            for index = 0, size - 1 do
                local key = objectArray[index + 1]
                local value = svg:opt(key)
                if require("allbinary_java").equals(self.shapeTypeFactory.KEY_LINE, key) then
                    self:addShapes(pointVector, value, self.shapeTypeFactory.LINE)
                elseif require("allbinary_java").equals(self.shapeTypeFactory, key) then
                    self:addShapes(pointVector, value, self.shapeTypeFactory.CIRCLE)
                elseif require("allbinary_java").equals(self.shapeTypeFactory.KEY_RECT, key) or require("allbinary_java").equals(self.shapeTypeFactory.KEY_RECTANGLE, key) then
                    self:addShapes(pointVector, value, self.shapeTypeFactory.RECTANGLE)
                end
            end
            do return "__jreturn", self:toPoints(pointVector) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            error(require("java.lang.IllegalArgumentException").new(self.ERROR_PARSE_SVG_JSON, e), 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
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
        if rawequal(shapeType, self.shapeTypeFactory.LINE) then
            self:addLine(pointVector, shape)
        elseif rawequal(shapeType, self.shapeTypeFactory.CIRCLE) then
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
            local angle = (require("java.lang.Math").PI * 2.0 * index) / self.CIRCLE_SEGMENTS
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
        pointVector:add({jt = "I", x, y})
end


function SVGAsJSONSimpleLoader:addSeparator(pointVector)
        pointVector:add({jt = "I", self.SHAPE_SEPARATOR[1], self.SHAPE_SEPARATOR[2]})
end


-- throws Exception
function SVGAsJSONSimpleLoader:readInt_j2(anyType, key)
        local value = anyType:get(key)
        if rawequal(value, nil) then
            error(require("java.lang.IllegalArgumentException").new(require("allbinary_java").to_string(self.ERROR_MISSING_KEY_PREFIX) .. require("allbinary_java").to_string(key)), 0)
        end
        return self:toInt(value, key)
end


function SVGAsJSONSimpleLoader:readInt_j3(anyType, key, defaultValue)
        local try_ok, try_error, try_value = pcall(function()
            if anyType:has(key) then
                local value = anyType:get(key)
                do return "__jreturn", self:toInt(value, key) end
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            print(debug.traceback(tostring(e)))
        end
        if try_ok and try_error == "__jreturn" then return try_value end
        return defaultValue
end
function SVGAsJSONSimpleLoader:readInt(...)
    local count = select("#", ...)
    if count == 2 then return self:readInt_j2(...) end
    if count == 3 then return self:readInt_j3(...) end
    error("No method readInt takes " .. count .. " arguments")
end
SVGAsJSONSimpleLoader.readInt__jdispatcher = SVGAsJSONSimpleLoader.readInt


function SVGAsJSONSimpleLoader:toInt(value, key)
        if java_instanceof(value, Number) then
            return java_int(math.floor(((value) + 0.0) + 0.5))
        end
        if java_instanceof(value, String) then
            return java_int(math.floor(tonumber(value) + 0.5))
        end
        error(require("java.lang.IllegalArgumentException").new(require("allbinary_java").to_string(self.ERROR_INVALID_NUMBER_PREFIX) .. require("allbinary_java").to_string(key)), 0)
end


function SVGAsJSONSimpleLoader:asObject(value, name)
        if java_instanceof(value, JSONObject) then
            return value
        end
        error(require("java.lang.IllegalArgumentException").new(require("allbinary_java").to_string(self.ERROR_EXPECTED_OBJECT_PREFIX) .. require("allbinary_java").to_string(name)), 0)
end


function SVGAsJSONSimpleLoader:toPoints(pointVector)
        if rawequal(pointVector:size(), 0) then
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
        local svgAsJson = require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string("{\"svg\": {\n") .. require("allbinary_java").to_string("    \"rect\": {\n")) .. require("allbinary_java").to_string("        \"width\": 20,\n")) .. require("allbinary_java").to_string("        \"fill\": \"#008c00\",\n")) .. require("allbinary_java").to_string("        \"height\": 20\n")) .. require("allbinary_java").to_string("    },\n")) .. require("allbinary_java").to_string("    \"xmlns\": \"http://www.w3.org/2000/svg\",\n")) .. require("allbinary_java").to_string("    \"width\": 20,\n")) .. require("allbinary_java").to_string("    \"height\": 20\n")) .. require("allbinary_java").to_string("}}\n")
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

SVGAsJSONSimpleLoader.instance_f = SVGAsJSONSimpleLoader.new()

return SVGAsJSONSimpleLoader

