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
-- package org.allbinary.layer

local AllBinaryLayerManager = {}
package.loaded["org.allbinary.layer.AllBinaryLayerManager"] = AllBinaryLayerManager

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

local LayerManagerEvent = java_lazy("org.allbinary.layer.event.LayerManagerEvent")
local LayerManagerEventHandler = java_lazy("org.allbinary.layer.event.LayerManagerEventHandler")
local LayerManager = require("org.allbinary.layer.LayerManager")
local AllBinaryLayer = java_lazy("org.allbinary.layer.AllBinaryLayer")
local LayerManagerNoDebug = java_lazy("org.allbinary.layer.LayerManagerNoDebug")
local LayerProcessor = java_lazy("org.allbinary.layer.LayerProcessor")

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

local function java_super(class, name, count)
    local mangled = name .. "_j" .. count
    local current = class
    while type(current) == "table" do
        local method = rawget(current, mangled)
        if method ~= nil then return method end
        method = rawget(current, name)
        if method ~= nil and method ~= rawget(current, name .. "__jdispatcher") then return method end
        local parent = getmetatable(current)
        local index = parent and parent.__index
        if index == current then index = nil end
        current = index
    end
    return class[name]
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

-- class table AllBinaryLayerManager is declared before the requires
AllBinaryLayerManager.__index = AllBinaryLayerManager
AllBinaryLayerManager.className = "AllBinaryLayerManager"
AllBinaryLayerManager.javaClassName = "org.allbinary.layer.AllBinaryLayerManager"
setmetatable(AllBinaryLayerManager, {__index = LayerManager})

function AllBinaryLayerManager:_init_fields()
    self.layerManagerEventHandler = LayerManagerEventHandler.getInstance()
    self.createLayerManagerEvent = LayerManagerEvent.new(self, self.layerManagerEventHandler.CREATE)
    self.deleteLayerManagerEvent = LayerManagerEvent.new(self, self.layerManagerEventHandler.DELETE)
    self.basicLayerProcessorArray = java_new_array(nil, 0)
end


function AllBinaryLayerManager._jinit(self)
    java_super_init(LayerManager, self, LayerManagerNoDebug.getInstance())
    AllBinaryLayerManager._init_fields(self)
        -- super(...) made self above
    return self
end

function AllBinaryLayerManager.new(...)
    local self = setmetatable({}, AllBinaryLayerManager)
    AllBinaryLayerManager._jinit(self, ...)
    return self
end


function AllBinaryLayerManager:getLayerProcessorArray()
        return self.basicLayerProcessorArray
end
java_overload(AllBinaryLayerManager, "getLayerProcessorArray", 0)


function AllBinaryLayerManager:setLayerProcessorArray(layerProcessorArray)
        self.basicLayerProcessorArray = layerProcessorArray
end
java_overload(AllBinaryLayerManager, "setLayerProcessorArray", 1, function(java_a1) return true and (java_a1 == nil or (type(java_a1) == "table" and getmetatable(java_a1) == nil and java_a1.jt == nil and (java_a1[1] == nil or type(java_a1[1]) == "table"))) end)


function AllBinaryLayerManager:log()
        local size = (self.basicLayerProcessorArray.n or #self.basicLayerProcessorArray)
        for index = 0, size - 1 do
            local layerProcessorInterface = self.basicLayerProcessorArray[index + 1]
        end
end
java_overload(AllBinaryLayerManager, "log", 0)


-- throws Exception
function AllBinaryLayerManager:append(layerInterface)
        if not self:contains(layerInterface) then
            self:appendProcessors(layerInterface)
            java_super(LayerManager, "append", 1)(self, layerInterface)
        end
end
java_overload(AllBinaryLayerManager, "append", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryLayer")) end)


-- throws Exception
function AllBinaryLayerManager:appendAt(layerInterface, index)
        if not self:contains(layerInterface) then
            self:appendProcessors(layerInterface)
            java_super(LayerManager, "appendAt", 2)(self, layerInterface, index)
        end
end
java_overload(AllBinaryLayerManager, "appendAt", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryLayer")) and type(java_a2) == "number" end)


-- throws Exception
function AllBinaryLayerManager:appendProcessors(layerInterface)
        self.createLayerManagerEvent:setLayerInterface(layerInterface)
        self.layerManagerEventHandler:fireEvent(self.createLayerManagerEvent)
        local layerProcessorInterface = nil
        do
            local index = (self.basicLayerProcessorArray.n or #self.basicLayerProcessorArray)
            while (function() index = index - 1 return index end)() >= 0 do
            layerProcessorInterface = self.basicLayerProcessorArray[index + 1]
            if layerProcessorInterface:isProcessorLayer(layerInterface) then
                layerProcessorInterface:getLayerManager():append(layerInterface)
            end
            end
        end
end
java_overload(AllBinaryLayerManager, "appendProcessors", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryLayer")) end)


-- throws Exception
function AllBinaryLayerManager:remove(layerInterface)
        self.deleteLayerManagerEvent:setLayerInterface(layerInterface)
        self.layerManagerEventHandler:fireDeleteEvent(self.deleteLayerManagerEvent)
        local layerProcessorInterface = nil
        do
            local index = (self.basicLayerProcessorArray.n or #self.basicLayerProcessorArray)
            while (function() index = index - 1 return index end)() >= 0 do
            layerProcessorInterface = self.basicLayerProcessorArray[index + 1]
            layerProcessorInterface:getLayerManager():remove(layerInterface)
            end
        end
        java_super(LayerManager, "remove", 1)(self, layerInterface)
end
java_overload(AllBinaryLayerManager, "remove", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryLayer")) end)


-- throws Exception
function AllBinaryLayerManager:process()
        local layerProcessorInterface = nil
        local size = (self.basicLayerProcessorArray.n or #self.basicLayerProcessorArray)
        for index = 0, size - 1 do
            layerProcessorInterface = self.basicLayerProcessorArray[index + 1]
            layerProcessorInterface:process(self)
        end
end
java_overload(AllBinaryLayerManager, "process", 0)


-- throws Exception
function AllBinaryLayerManager:cleanup()
        local layerProcessorInterface = nil
        local size = (self.basicLayerProcessorArray.n or #self.basicLayerProcessorArray)
        for index = 0, size - 1 do
            layerProcessorInterface = self.basicLayerProcessorArray[index + 1]
            layerProcessorInterface:getLayerManager():cleanup()
        end
        java_super(LayerManager, "cleanup", 0)(self)
end
java_overload(AllBinaryLayerManager, "cleanup", 0)

return AllBinaryLayerManager

