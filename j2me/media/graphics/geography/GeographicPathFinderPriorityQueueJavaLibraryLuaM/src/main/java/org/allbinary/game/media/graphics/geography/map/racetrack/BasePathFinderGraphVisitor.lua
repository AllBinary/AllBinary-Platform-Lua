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
-- package org.allbinary.game.media.graphics.geography.map.racetrack

local BasePathFinderGraphVisitor = {}
package.loaded["org.allbinary.game.media.graphics.geography.map.racetrack.BasePathFinderGraphVisitor"] = BasePathFinderGraphVisitor

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

local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local BasicGeographicMap = java_lazy("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local PathFinderGraphVisitorBase = require("org.allbinary.media.graphics.geography.pathfinding.PathFinderGraphVisitorBase")
local PathFindingNode = java_lazy("org.allbinary.media.graphics.geography.pathfinding.PathFindingNode")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")

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

--1.4.2
-- class table BasePathFinderGraphVisitor is declared before the requires
BasePathFinderGraphVisitor.__index = BasePathFinderGraphVisitor
BasePathFinderGraphVisitor.className = "BasePathFinderGraphVisitor"
BasePathFinderGraphVisitor.javaClassName = "org.allbinary.game.media.graphics.geography.map.racetrack.BasePathFinderGraphVisitor"
setmetatable(BasePathFinderGraphVisitor, {__index = PathFinderGraphVisitorBase})

function BasePathFinderGraphVisitor:_init_fields()
    if self.geographicMapInterface == nil then self.geographicMapInterface = nil end
    if self.edgeMinimum == nil then self.edgeMinimum = 0 end
    if self.minPathWeight == nil then self.minPathWeight = 0 end
    if self.maxPathWeight == nil then self.maxPathWeight = 0 end
end


function BasePathFinderGraphVisitor._jinit(self, geographicMapInterface, edgeMinimum, minPathWeight, maxPathWeight)
    java_super_init(PathFinderGraphVisitorBase, self)
    BasePathFinderGraphVisitor._init_fields(self)
        self.geographicMapInterface = geographicMapInterface
        self.edgeMinimum = edgeMinimum
        self.minPathWeight = minPathWeight
        self.maxPathWeight = maxPathWeight
    return self
end

function BasePathFinderGraphVisitor.new(...)
    local self = setmetatable({}, BasePathFinderGraphVisitor)
    BasePathFinderGraphVisitor._jinit(self, ...)
    return self
end


-- throws Exception
function BasePathFinderGraphVisitor:visit(graph, startPathFindingNodeList, endPathFindingNodeList)
end
java_overload(BasePathFinderGraphVisitor, "visit", 3, function(java_a1, java_a2, java_a3) return true and (java_a2 == nil or java_is(java_a2, "BasicArrayList")) and (java_a3 == nil or java_is(java_a3, "BasicArrayList")) end)


-- throws Exception
function BasePathFinderGraphVisitor:fixPath(startPathFindingNodeList, endPathFindingNodeList, pathList)
        local startPathFindingNode = nil
        for index = startPathFindingNodeList:size() - 1, 0, -1 do
            startPathFindingNode = startPathFindingNodeList:get(index)
            pathList:remove(startPathFindingNode.geographicMapCellPosition)
            pathList:addAt(0, startPathFindingNode.geographicMapCellPosition)
        end
end
java_overload(BasePathFinderGraphVisitor, "fixPath", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or java_is(java_a1, "BasicArrayList")) and (java_a2 == nil or java_is(java_a2, "BasicArrayList")) and (java_a3 == nil or java_is(java_a3, "BasicArrayList")) end)


function BasePathFinderGraphVisitor:isValid(graphPath)
        return false
end
java_overload(BasePathFinderGraphVisitor, "isValid", 1)


function BasePathFinderGraphVisitor:getInvalidReason(graphPath)
        return StringUtil.getInstance().EMPTY_STRING
end
java_overload(BasePathFinderGraphVisitor, "getInvalidReason", 1)

return BasePathFinderGraphVisitor

