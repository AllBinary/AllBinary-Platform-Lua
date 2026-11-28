--
-- AllBinary Open License Version 1
-- Copyright (c) 2006 AllBinary
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
-- package org.allbinary.media.graphics.geography.pathfinding

local PathFindingNodeCost = {}
package.loaded["org.allbinary.media.graphics.geography.pathfinding.PathFindingNodeCost"] = PathFindingNodeCost

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

local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local GeographicMapCellPosition = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")
local PathFindingNode = require("org.allbinary.media.graphics.geography.pathfinding.PathFindingNode")
-- java.lang.Comparable has no Lua module
local Comparable = {}
local PathFindingNodeCostInfo = java_lazy("org.allbinary.media.graphics.geography.pathfinding.PathFindingNodeCostInfo")

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

local function java_class_matches(class, name)
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
local java_type_matches = setmetatable({}, {__mode = "k"})
local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    if type(class) ~= "table" then return false end
    local matches = java_type_matches[class]
    if matches and matches[name] then return true end
    if not java_class_matches(class, name) then return false end
    if not matches then matches = {}; java_type_matches[class] = matches end
    matches[name] = true
    return true
end

local function java_super_init(base, self, ...)
    local init = rawget(base, "_jinit")
    if init ~= nil then return init(self, ...) end
    if base.new ~= nil then
        local object = base.new(...)
        if type(object) == "table" then
            for key, value in pairs(object) do if rawget(self, key) == nil then self[key] = value end end
        end
    end
end

local function java_overload(class, name, count, test)
    local parent = getmetatable(class)
    local base = parent and parent.__index
    if type(base) ~= "table" or base == class then return end
    local override = rawget(class, name)
    local mangled = name .. "_j" .. count
    -- an inherited overload with the same count and other parameter types (Control.drawBackground(hDC, rect, pixel, tx, ty)
    -- and Canvas.drawBackground(gc, x, y, width, height)) is called when the arguments do not match the override
    local typed = function(self, ...)
        if test == nil or test(...) then return override(self, ...) end
        local inherited = base[mangled]
        if inherited == nil then local plain = base[name] if plain ~= nil and plain ~= base[name .. "__jdispatcher"] then inherited = plain end end
        if inherited == nil or inherited == override then return override(self, ...) end
        return inherited(self, ...)
    end
    class[mangled] = typed
    -- the inherited method is looked up at the call: the base class can still be loading (require cycle)
    local dispatcher = function(self, ...)
        if select("#", ...) == count then return typed(self, ...) end
        local inherited = base[name]
        if inherited == nil then return override(self, ...) end
        return inherited(self, ...)
    end
    class[name] = dispatcher
    class[name .. "__jdispatcher"] = dispatcher
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

-- class table PathFindingNodeCost is declared before the requires
PathFindingNodeCost.__index = PathFindingNodeCost
PathFindingNodeCost.className = "PathFindingNodeCost"
PathFindingNodeCost.javaClassName = "org.allbinary.media.graphics.geography.pathfinding.PathFindingNodeCost"
setmetatable(PathFindingNodeCost, {__index = PathFindingNode})
PathFindingNodeCost.java_implements = " Comparable "
PathFindingNodeCost.java_interfaces = function() return {Comparable} end

function PathFindingNodeCost:_init_fields()
    self.commonSeps = CommonSeps.getInstance()
    if self.pathFindingNodeCostInfoP == nil then self.pathFindingNodeCostInfoP = nil end
end


function PathFindingNodeCost._jinit(self, parent, geographicMapCellPosition, pathFindingNodeCostInfo)
    java_super_init(PathFindingNode, self, parent, geographicMapCellPosition)
    PathFindingNodeCost._init_fields(self)
        -- super(...) made self above
        self.pathFindingNodeCostInfoP = pathFindingNodeCostInfo
        if rawequal(self.geographicMapCellPosition, nil) then
            error(require("java.lang.Exception").new("No GeographicMapCellPosition"), 0)
        end
        if rawequal(self:getPathFindingNodeCostInfo(), nil) then
            error(require("java.lang.Exception").new("No PathFindingNodeCostInfo"), 0)
        end
    return self
end

function PathFindingNodeCost.new(...)
    local self = setmetatable({}, PathFindingNodeCost)
    PathFindingNodeCost._jinit(self, ...)
    return self
end


function PathFindingNodeCost:getPathFindingNodeCostInfo()
        return self.pathFindingNodeCostInfoP
end
java_overload(PathFindingNodeCost, "getPathFindingNodeCostInfo", 0)


function PathFindingNodeCost:setPathFindingNodeCostInfo(pathFindingNodeCostInfo)
        self.pathFindingNodeCostInfoP = pathFindingNodeCostInfo
end
java_overload(PathFindingNodeCost, "setPathFindingNodeCostInfo", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "PathFindingNodeCostInfo")) end)


function PathFindingNodeCost:compareTo(pathFindingNodeCost)
        return self.pathFindingNodeCostInfoP:compareTo(pathFindingNodeCost.pathFindingNodeCostInfoP)
end
java_overload(PathFindingNodeCost, "compareTo", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "PathFindingNodeCost")) end)


function PathFindingNodeCost:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append((getmetatable(self).javaClassName or getmetatable(self).className))
        stringBuffer:append(CommonLabels.getInstance().COLON_SEP)
        stringBuffer:append(tostring(self:getPathFindingNodeCostInfo()))
        stringBuffer:append(" Path: ")
        stringBuffer:append(tostring(self.geographicMapCellPosition))
        local pathFindingNode = self.parent
        while not rawequal(pathFindingNode, nil) do
            stringBuffer:append(tostring(pathFindingNode.geographicMapCellPosition))
            stringBuffer:append(self.commonSeps.SPACE)
            pathFindingNode = pathFindingNode.parent
        end
        return tostring(stringBuffer)
end
java_overload(PathFindingNodeCost, "toString", 0)
PathFindingNodeCost.__tostring = function(self) return self:toString() end

PathFindingNodeCost.NULL_PATH_FINDING_NODE_COST_ARRAY_ARRAY = java_new_array(nil, 0, 0)

return PathFindingNodeCost

