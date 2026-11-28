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

local LayerManagerLogging = {}
package.loaded["org.allbinary.layer.LayerManagerLogging"] = LayerManagerLogging

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

local TsUtil = java_lazy("org.allbinary.TsUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local LayerManagerLoggingBase = require("org.allbinary.layer.LayerManagerLoggingBase")
local AllBinaryLayer = java_lazy("org.allbinary.layer.AllBinaryLayer")
local LayerManager = java_lazy("org.allbinary.layer.LayerManager")

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

-- class table LayerManagerLogging is declared before the requires
LayerManagerLogging.__index = LayerManagerLogging
LayerManagerLogging.className = "LayerManagerLogging"
LayerManagerLogging.javaClassName = "org.allbinary.layer.LayerManagerLogging"
setmetatable(LayerManagerLogging, {__index = LayerManagerLoggingBase})

function LayerManagerLogging:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.stringBuilder = StringMaker.new()
    self.APPEND = "append"
    self.APPEND_ = " append: "
    self._AT_ = " at: "
    self.ATTEMPT_REMOVE_ = " Remove Attempt: "
    self.REMOVE_ = " Remove: "
    self.REMOVE = "remove"
    self.DID_NOT_REMOVE = " Did not remove: "
    self.CLEAR = " Clear List"
end

function LayerManagerLogging._jinit(self)
    java_super_init(LayerManagerLoggingBase, self)
    LayerManagerLogging._init_fields(self)
    return self
end

function LayerManagerLogging.new()
    return LayerManagerLogging._jinit(setmetatable({}, LayerManagerLogging))
end


function LayerManagerLogging.getInstance()
        return LayerManagerLogging.instance_f
end


-- throws Exception
function LayerManagerLogging:append(layerInterface)
        self.stringBuilder:delete(0, self.stringBuilder:length())
        self.logUtil:putF(tostring(self.stringBuilder:appendint(java_int(TsUtil.getInstance():hashCode(self))):append(self.APPEND_):append(layerInterface:getName())), self, self.APPEND)
end
java_overload(LayerManagerLogging, "append", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryLayer")) end)


function LayerManagerLogging:appendAt(layerInterface, index)
        self.stringBuilder:delete(0, self.stringBuilder:length())
        self.logUtil:putF(tostring(self.stringBuilder:appendint(java_int(TsUtil.getInstance():hashCode(self))):append(self.APPEND_):append(layerInterface:getName()):append(self._AT_):appendint(index)), self, self.APPEND)
end
java_overload(LayerManagerLogging, "appendAt", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryLayer")) and type(java_a2) == "number" end)


function LayerManagerLogging:remove(layerInterface)
        if rawequal(layerInterface, nil) then
            self.stringBuilder:delete(0, self.stringBuilder:length())
            self.logUtil:putF(tostring(self.stringBuilder:appendint(java_int(TsUtil.getInstance():hashCode(self))):append(self.ATTEMPT_REMOVE_):append(StringUtil.getInstance():toString(layerInterface))), self, self.REMOVE)
        else
            self.stringBuilder:delete(0, self.stringBuilder:length())
            self.logUtil:putF(tostring(self.stringBuilder:appendint(java_int(TsUtil.getInstance():hashCode(self))):append(self.ATTEMPT_REMOVE_):append(layerInterface:getName())), self, self.REMOVE)
        end
end
java_overload(LayerManagerLogging, "remove", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryLayer")) end)


function LayerManagerLogging:removeResult(layerManager, layerInterface, result)
        if rawequal(layerInterface, nil) then
            self.stringBuilder:delete(0, self.stringBuilder:length())
            self.logUtil:putF(tostring(self.stringBuilder:appendint(java_int(TsUtil.getInstance():hashCode(self))):append(self.REMOVE_):append(StringUtil.getInstance():toString(layerInterface))), self, self.REMOVE)
        elseif result then
            if LayerManagerLogging.removeFailed then
                self.stringBuilder:delete(0, self.stringBuilder:length())
                self.logUtil:putF(tostring(self.stringBuilder:appendint(java_int(TsUtil.getInstance():hashCode(self))):append(self.REMOVE_):append(layerInterface:getName())), self, self.REMOVE)
            end
        else
            self.stringBuilder:delete(0, self.stringBuilder:length())
            self.logUtil:putF(tostring(self.stringBuilder:appendint(java_int(TsUtil.getInstance():hashCode(self))):append(self.DID_NOT_REMOVE):append(layerInterface:getName())), self, self.REMOVE)
            LayerManagerLogging.removeFailed = true
        end
end
java_overload(LayerManagerLogging, "removeResult", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or java_is(java_a1, "LayerManager")) and (java_a2 == nil or java_is(java_a2, "AllBinaryLayer")) and type(java_a3) == "boolean" end)


function LayerManagerLogging:log(layerManager)
        self.stringBuilder:delete(0, self.stringBuilder:length())
        local size = layerManager:getSize()
        local commonSeps = CommonSeps.getInstance()
        self.stringBuilder:append(string.format("%x", TsUtil.getInstance():hashCode(layerManager))):append(commonSeps.COLON_SEP)
        self.stringBuilder:appendint(size):append(commonSeps.COLON_SEP)
        local allBinaryLayer = nil
        for index = 0, size - 1 do
            allBinaryLayer = (layerManager:getLayerAt(index))
            self.stringBuilder:append(allBinaryLayer:getName()):append(commonSeps.COMMA)
        end
        self.logUtil:putF(tostring(self.stringBuilder), self, self.REMOVE)
end
java_overload(LayerManagerLogging, "log", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "LayerManager")) end)


function LayerManagerLogging:clear()
        self.stringBuilder:delete(0, self.stringBuilder:length())
        self.logUtil:putF(tostring(self.stringBuilder:appendint(java_int(TsUtil.getInstance():hashCode(self))):append(self.CLEAR)), self, self.CLEAR)
end
java_overload(LayerManagerLogging, "clear", 0)

LayerManagerLogging.instance_f = LayerManagerLogging.new()
LayerManagerLogging.removeFailed = false

return LayerManagerLogging

