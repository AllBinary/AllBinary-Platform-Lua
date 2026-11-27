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
-- package org.allbinary.logic.communication.java.vm.stats

local JvmStatisticsMapping = {}
package.loaded["org.allbinary.logic.communication.java.vm.stats.JvmStatisticsMapping"] = JvmStatisticsMapping

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

local HashMap = java_lazy("java.util.HashMap")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local TableMappingInterface = java_lazy("org.allbinary.data.tables.TableMappingInterface")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local JvmStatistics = require("org.allbinary.logic.communication.java.vm.stats.JvmStatistics")
local JvmStatisticsData = java_lazy("org.allbinary.logic.communication.java.vm.stats.JvmStatisticsData")

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

-- class table JvmStatisticsMapping is declared before the requires
JvmStatisticsMapping.__index = JvmStatisticsMapping
JvmStatisticsMapping.className = "JvmStatisticsMapping"
JvmStatisticsMapping.javaClassName = "org.allbinary.logic.communication.java.vm.stats.JvmStatisticsMapping"
setmetatable(JvmStatisticsMapping, {__index = JvmStatistics})
JvmStatisticsMapping.java_implements = " TableMappingInterface "
JvmStatisticsMapping.java_interfaces = function() return {TableMappingInterface} end


function JvmStatisticsMapping._jinit(self)
    java_super_init(JvmStatistics, self)
        -- super(...) made self above
    return self
end

function JvmStatisticsMapping.new(...)
    local self = setmetatable({}, JvmStatisticsMapping)
    JvmStatisticsMapping._jinit(self, ...)
    return self
end


function JvmStatisticsMapping:toHashMap()
        local hashMap = StdUtil.getInstance():createHashMap()
        hashMap:put(JvmStatisticsData.FREE_MEMORY_BYTES, self:getFreeMemoryBytesString())
        hashMap:put(JvmStatisticsData.FREE_MEMORY_KILOBYTES, self:getFreeMemoryKilobytesString())
        hashMap:put(JvmStatisticsData.FREE_MEMORY_MEGABYTES, self:getFreeMemoryMegabytesString())
        hashMap:put(JvmStatisticsData.MAX_MEMORY_BYTES, self:getMaxMemoryBytesString())
        hashMap:put(JvmStatisticsData.MAX_MEMORY_KILOBYTES, self:getMaxMemoryKilobytesString())
        hashMap:put(JvmStatisticsData.MAX_MEMORY_MEGABYTES, self:getMaxMemoryMegabytesString())
        hashMap:put(JvmStatisticsData.NUMBER_OF_THREADS, self:getNumberOfThreadsString())
        hashMap:put(JvmStatisticsData.TOTAL_MEMORY_BYTES, self:getTotalMemoryBytesString())
        hashMap:put(JvmStatisticsData.TOTAL_MEMORY_KILOBYTES, self:getTotalMemoryKilobytesString())
        hashMap:put(JvmStatisticsData.TOTAL_MEMORY_MEGABYTES, self:getTotalMemoryMegabytesString())
        return hashMap
end
java_overload(JvmStatisticsMapping, "toHashMap", 0)


-- throws Exception
function JvmStatisticsMapping:getKey()
        return JvmStatisticsData.NAME
end
java_overload(JvmStatisticsMapping, "getKey", 0)


-- throws Exception
function JvmStatisticsMapping:toVector()
        local vector = BasicArrayListD.new()
        vector:add(self:getFreeMemoryBytesString())
        vector:add(self:getFreeMemoryKilobytesString())
        vector:add(self:getFreeMemoryMegabytesString())
        vector:add(self:getMaxMemoryBytesString())
        vector:add(self:getMaxMemoryKilobytesString())
        vector:add(self:getMaxMemoryMegabytesString())
        vector:add(self:getNumberOfThreadsString())
        vector:add(self:getTotalMemoryBytesString())
        vector:add(self:getTotalMemoryKilobytesString())
        vector:add(self:getTotalMemoryMegabytesString())
        return vector
end
java_overload(JvmStatisticsMapping, "toVector", 0)

return JvmStatisticsMapping

