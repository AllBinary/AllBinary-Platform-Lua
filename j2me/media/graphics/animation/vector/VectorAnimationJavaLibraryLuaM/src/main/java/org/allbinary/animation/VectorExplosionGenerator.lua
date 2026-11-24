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

local VectorExplosionGenerator = {}
package.loaded["org.allbinary.animation.VectorExplosionGenerator"] = VectorExplosionGenerator

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
local RandomRotationFactory = java_lazy("org.allbinary.graphics.pipeline.RandomRotationFactory")
local RandomTranslation = java_lazy("org.allbinary.graphics.pipeline.RandomTranslation")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local BasicArrayListS = java_lazy("org.allbinary.util.BasicArrayListS")
local VectorAnimationUtil = java_lazy("org.allbinary.animation.VectorAnimationUtil")
local VectorExplosionType = java_lazy("org.allbinary.animation.VectorExplosionType")

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

-- class table VectorExplosionGenerator is declared before the requires
VectorExplosionGenerator.__index = VectorExplosionGenerator
VectorExplosionGenerator.className = "VectorExplosionGenerator"
VectorExplosionGenerator.javaClassName = "org.allbinary.animation.VectorExplosionGenerator"

function VectorExplosionGenerator:_init_fields()
    self.RANDOM = VectorExplosionType.new()
    self.ROTATION = VectorExplosionType.new()
    self.vectorAnimationUtil = VectorAnimationUtil.getInstance()
    self.randomRotationFactory = RandomRotationFactory.getInstance()
end


function VectorExplosionGenerator.getInstance()
        return VectorExplosionGenerator.instance_f
end


function VectorExplosionGenerator._jinit(self)
    VectorExplosionGenerator._init_fields(self)
    return self
end

function VectorExplosionGenerator.new(...)
    local self = setmetatable({}, VectorExplosionGenerator)
    VectorExplosionGenerator._jinit(self, ...)
    return self
end


-- throws Exception
function VectorExplosionGenerator:createList(list, howMuch, type)
        local point = nil
        local size = list:size()
        local points = java_new_array(0, size, 2)
        for index = 0, size - 1 do
            point = list.objectArray[index + 1]
            points[index + 1][1] = point:getX()
            points[index + 1][2] = point:getY()
        end
        return self:createListFromPoints(list, points, howMuch, type)
end


-- throws Exception
function VectorExplosionGenerator:getInstance(points, howMuch, type)
        local pointsBasicArrayList = self:getInstanceStartFrame(points, howMuch, type, true)
        local tempBasicArrayList = pointsBasicArrayList.objectArray[1]
        local newPoints = self.vectorAnimationUtil:toAnimationArrayFromListOfPointListWithPointsPerFrame(pointsBasicArrayList, tempBasicArrayList:size())
        return newPoints
end


-- throws Exception
function VectorExplosionGenerator:getInstanceStartFrame(points, howMuch, type, startFrame)
        local try_ok, try_error, try_value = pcall(function()
            local pointsBasicArrayList = BasicArrayListS.new(howMuch)
            pointsBasicArrayList:add(self:createPointsBasicArrayList(points))
            local frameIndex = 0
            local tempBasicArrayList = nil
            local pointBasicArrayList = nil
            while frameIndex < howMuch do
                tempBasicArrayList = pointsBasicArrayList.objectArray[frameIndex + 1]
                pointBasicArrayList = self:createListFromPoints(tempBasicArrayList, points, howMuch, type)
                pointsBasicArrayList:add(pointBasicArrayList)
                frameIndex = frameIndex + 1
            end
            if not startFrame then
                pointsBasicArrayList:removeAt(0)
            end
            do return "__jreturn", pointsBasicArrayList end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


-- throws Exception
function VectorExplosionGenerator:createListFromPoints(tempBasicArrayList, points, howMuch, type)
        local index = 0
        local pointBasicArrayList = BasicArrayListD.new()
        local sectionBasicArrayList = nil
        while index < (points.n or #points) do
            sectionBasicArrayList = BasicArrayListD.new()
            while points[index + 1][1] ~= 1000 do
                sectionBasicArrayList:add(tempBasicArrayList.objectArray[index + 1])
                index = index + 1
                if index >= (points.n or #points) then
                    break
                end
            end
            sectionBasicArrayList = RandomTranslation.getInstance(sectionBasicArrayList, howMuch)
            if type == self.ROTATION then
                sectionBasicArrayList = self.randomRotationFactory:getInstanceList(sectionBasicArrayList, howMuch)
            end
            local size = sectionBasicArrayList:size()
            for index2 = 0, size - 1 do
                pointBasicArrayList:add(sectionBasicArrayList.objectArray[index2 + 1])
            end
            if index >= (points.n or #points) then
                break
            elseif points[index + 1][1] == 1000 then
                pointBasicArrayList:add(tempBasicArrayList.objectArray[index + 1])
                index = index + 1
            end
        end
        return pointBasicArrayList
end


-- throws Exception
function VectorExplosionGenerator:createPointsBasicArrayList(points)
        if (points.n or #points) == 0 then
            error(require("java.lang.Exception").new("Not Points Provided"), 0)
        end
        local firstPointBasicArrayList = BasicArrayListS.new((points.n or #points))
        local pointFactory = PointFactory.getInstance()
        for index = 0, (points.n or #points) - 1 do
            firstPointBasicArrayList:add(pointFactory:createXY(points[index + 1][1], points[index + 1][2]))
        end
        return firstPointBasicArrayList
end

VectorExplosionGenerator.instance_f = VectorExplosionGenerator.new()

return VectorExplosionGenerator

