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

local VectorMirrorGenerator = {}
package.loaded["org.allbinary.animation.VectorMirrorGenerator"] = VectorMirrorGenerator

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
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListS = java_lazy("org.allbinary.util.BasicArrayListS")
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

-- class table VectorMirrorGenerator is declared before the requires
VectorMirrorGenerator.__index = VectorMirrorGenerator
VectorMirrorGenerator.className = "VectorMirrorGenerator"
VectorMirrorGenerator.javaClassName = "org.allbinary.animation.VectorMirrorGenerator"

function VectorMirrorGenerator:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.vectorAnimationUtil = VectorAnimationUtil.getInstance()
end


function VectorMirrorGenerator.getInstance()
        return VectorMirrorGenerator.instance_f
end


function VectorMirrorGenerator._jinit(self)
    VectorMirrorGenerator._init_fields(self)
    return self
end

function VectorMirrorGenerator.new(...)
    local self = setmetatable({}, VectorMirrorGenerator)
    VectorMirrorGenerator._jinit(self, ...)
    return self
end


function VectorMirrorGenerator:getInstance_j2_1(points, width)
        local try_ok, try_error, try_value = pcall(function()
            local pointFactory = PointFactory.getInstance()
            local pointBasicArrayList = nil
            local nextPoints = nil
            local size2 = 0
            local size = (points.n or #points)
            local pointsBasicArrayList = BasicArrayListS.new(size)
            for frame = 0, size - 1 do
                nextPoints = points[frame + 1]
                size2 = (nextPoints.n or #nextPoints)
                pointBasicArrayList = BasicArrayListS.new(size2)
                for index = 0, size2 - 1 do
                    pointBasicArrayList:add(pointFactory:createXY(nextPoints[index + 1][1], nextPoints[index + 1][2]))
                end
                pointsBasicArrayList:add(pointBasicArrayList)
            end
            for index = 0, (points.n or #points) - 1 do
                pointsBasicArrayList:add(self:getInstance(pointsBasicArrayList.objectArray[index + 1], width))
            end
            local newPoints = self.vectorAnimationUtil:toAnimationArrayFromListOfPointList(pointsBasicArrayList)
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
function VectorMirrorGenerator:getInstance_j2_2(pointBasicArrayList, width)
        local graphicsPipe = BasicGraphicsPipeline.new(pointBasicArrayList)
        graphicsPipe:createMatrix()
        graphicsPipe:mirror(width)
        return graphicsPipe:getMatrix()
end
function VectorMirrorGenerator:getInstance(...)
    local count = select("#", ...)
    if count == 2 then return self:getInstance_j2(...) end
    error("No method getInstance takes " .. count .. " arguments")
end
VectorMirrorGenerator.getInstance__jdispatcher = VectorMirrorGenerator.getInstance
function VectorMirrorGenerator:getInstance_j2(...)
    local java_a1, java_a2 = ...
    if true and (java_a1 == nil or (type(java_a1) == "table" and getmetatable(java_a1) == nil and java_a1.jt == nil and (java_a1[1] == nil or type(java_a1[1]) == "table"))) and math.type(java_a2) == "integer" then return VectorMirrorGenerator.getInstance_j2_1(self, ...) end
    return VectorMirrorGenerator.getInstance_j2_2(self, ...)
end

VectorMirrorGenerator.instance_f = VectorMirrorGenerator.new()

return VectorMirrorGenerator

