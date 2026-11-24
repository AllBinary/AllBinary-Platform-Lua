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

local VectorRotationGenerator = {}
package.loaded["org.allbinary.animation.VectorRotationGenerator"] = VectorRotationGenerator

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

local PointFactory = java_lazy("org.allbinary.graphics.PointFactory")
local BasicGraphicsPipeline = java_lazy("org.allbinary.graphics.pipeline.BasicGraphicsPipeline")
local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local Angle = java_lazy("org.allbinary.math.Angle")
local AngleFactory = java_lazy("org.allbinary.math.AngleFactory")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListS = java_lazy("org.allbinary.util.BasicArrayListS")
local VectorInfo = java_lazy("org.allbinary.vector.VectorInfo")
local VectorAnimationUtil = java_lazy("org.allbinary.animation.VectorAnimationUtil")

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

-- class table VectorRotationGenerator is declared before the requires
VectorRotationGenerator.__index = VectorRotationGenerator
VectorRotationGenerator.className = "VectorRotationGenerator"
VectorRotationGenerator.javaClassName = "org.allbinary.animation.VectorRotationGenerator"

function VectorRotationGenerator:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.vectorAnimationUtil = VectorAnimationUtil.getInstance()
    self.angleFactory = AngleFactory.getInstance()
end


function VectorRotationGenerator.getInstance()
        return VectorRotationGenerator.instance_f
end


function VectorRotationGenerator._jinit(self)
    VectorRotationGenerator._init_fields(self)
    return self
end

function VectorRotationGenerator.new(...)
    local self = setmetatable({}, VectorRotationGenerator)
    VectorRotationGenerator._jinit(self, ...)
    return self
end


function VectorRotationGenerator:getInstance(vectorRotationInfo)
        return self:getInstanceFrames(vectorRotationInfo:getWidth(), vectorRotationInfo:getHeight(), vectorRotationInfo:getPoints(), vectorRotationInfo:getTotalFrames())
end


function VectorRotationGenerator:getInstanceFrames(width, height, points, frames)
        local try_ok, try_error, try_value = pcall(function()
            local totalAngle = self.angleFactory.TOTAL_ANGLE
            local angleIncrement = java_idiv(totalAngle, frames)
            local pointsBasicArrayList = BasicArrayListS.new(java_idiv(totalAngle, angleIncrement))
            local pointBasicArrayList = BasicArrayListS.new((points.n or #points))
            local pointFactory = PointFactory.getInstance()
            local size = (points.n or #points)
            for index = 0, size - 1 do
                pointBasicArrayList:add(pointFactory:createXY(points[index + 1][1], points[index + 1][2]))
            end
            local index = 0
            while index < totalAngle do
                pointsBasicArrayList:add(self:getListAtAngle(width, height, pointBasicArrayList, self.angleFactory:getAt(index)))
                index = index + (angleIncrement)
            end
            local newPoints = self.vectorAnimationUtil:toAnimationArrayFromListOfPointListWithPointsPerFrame(pointsBasicArrayList, pointBasicArrayList:size())
            do return "__jreturn", newPoints end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.GET_INSTANCE, e)
            return NullUtil.getInstance().NULL_INT_ARRAY_ARRAY_ARRAY
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


-- throws Exception
function VectorRotationGenerator:getListAtAngle(width, height, pointBasicArrayList, angle)
        local graphicsPipe = BasicGraphicsPipeline.new(pointBasicArrayList)
        graphicsPipe:createMatrix()
        graphicsPipe:translate(-((width) // (1 << (1))), -((height) // (1 << (1))))
        graphicsPipe:rotateToAngle(angle)
        graphicsPipe:translate((((width) // (1 << (1)))), (((height) // (1 << (1)))))
        return graphicsPipe:getMatrix()
end

VectorRotationGenerator.instance_f = VectorRotationGenerator.new()

return VectorRotationGenerator

