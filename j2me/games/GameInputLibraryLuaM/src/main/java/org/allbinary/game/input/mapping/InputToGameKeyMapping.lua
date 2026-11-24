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
-- package org.allbinary.game.input.mapping

local InputToGameKeyMapping = {}
package.loaded["org.allbinary.game.input.mapping.InputToGameKeyMapping"] = InputToGameKeyMapping

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

-- local Canvas = require("javax.microedition.lcdui.Canvas")
local GameKey = java_lazy("org.allbinary.game.input.GameKey")
local GameKeyFactory = java_lazy("org.allbinary.game.input.GameKeyFactory")
local Input = java_lazy("org.allbinary.game.input.Input")
local InputFactory = java_lazy("org.allbinary.game.input.InputFactory")
local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local PreLogUtil = java_lazy("org.allbinary.logic.communication.log.PreLogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local InputMapping = require("org.allbinary.game.input.mapping.InputMapping")

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

-- class table InputToGameKeyMapping is declared before the requires
InputToGameKeyMapping.__index = InputToGameKeyMapping
InputToGameKeyMapping.className = "InputToGameKeyMapping"
InputToGameKeyMapping.javaClassName = "org.allbinary.game.input.mapping.InputToGameKeyMapping"
setmetatable(InputToGameKeyMapping, {__index = InputMapping})

function InputToGameKeyMapping:_init_fields()
    self.gameKeyFactory = GameKeyFactory.getInstance()
    self.mappedGameKeys = {self.gameKeyFactory.UP, self.gameKeyFactory.DOWN, self.gameKeyFactory.LEFT, self.gameKeyFactory.RIGHT}
    self.platformToGameKeyMapping = java_new_array(nil, InputFactory.getInstance().MAX)
    self.negativePlatformToGameKeyMapping = java_new_array(nil, 0)
end


function InputToGameKeyMapping.getNullInstance()
        if InputToGameKeyMapping.instance_f == NullUtil.getInstance().NULL_OBJECT then
            InputToGameKeyMapping.instance_f = InputToGameKeyMapping.new()
        end
        return InputToGameKeyMapping.instance_f
end


function InputToGameKeyMapping._jinit(self)
    java_super_init(InputMapping, self)
    InputToGameKeyMapping._init_fields(self)
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        self:clear()
    return self
end

function InputToGameKeyMapping.new(...)
    local self = setmetatable({}, InputToGameKeyMapping)
    InputToGameKeyMapping._jinit(self, ...)
    return self
end


function InputToGameKeyMapping:clear()
        for index = (self.platformToGameKeyMapping.n or #self.platformToGameKeyMapping) - 1, 0, -1 do
            self.platformToGameKeyMapping[index + 1] = self.gameKeyFactory.NONE
        end
end
java_overload(InputToGameKeyMapping, "clear", 0)


function InputToGameKeyMapping:removeAll()
        java_super(InputMapping, "removeAll", 0)(self)
        self:clear()
end
java_overload(InputToGameKeyMapping, "removeAll", 0)


function InputToGameKeyMapping:addMapping(inputToGameKeyMapping)
        for index = inputToGameKeyMapping:getMaxMappable() - 1, 0, -1 do
            local input = inputToGameKeyMapping:getInstance(index)
            if input ~= self.gameKeyFactory.NONE then
                self:addAll(input, inputToGameKeyMapping:getMappedInput(input))
            end
        end
end
java_overload(InputToGameKeyMapping, "addMapping", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "InputToGameKeyMapping")) end)


function InputToGameKeyMapping:addAll(input, list)
        for index = list:size() - 1, 0, -1 do
            local mappedToInput = list.objectArray[index + 1]
            self:add(input, mappedToInput)
        end
end
java_overload(InputToGameKeyMapping, "addAll", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "Input")) and (java_a2 == nil or java_is(java_a2, "BasicArrayList")) end)


function InputToGameKeyMapping:add(input, mappedToInput)
        java_super(InputMapping, "add", 2)(self, input, mappedToInput)
        self:set(input, mappedToInput)
end
java_overload(InputToGameKeyMapping, "add", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "Input")) and (java_a2 == nil or java_is(java_a2, "Input")) end)


function InputToGameKeyMapping:remove(input, mappedToInput)
        self.logUtil:putF(tostring(StringMaker.new():append(CommonLabels.getInstance().START_LABEL):append(StringUtil.getInstance():toString(input)):append(" == "):append(StringUtil.getInstance():toString(mappedToInput))), self, "InputToGameKeyMapping::remove")
        java_super(InputMapping, "remove", 2)(self, input, mappedToInput)
        self:set(input, self.gameKeyFactory.NONE)
end
java_overload(InputToGameKeyMapping, "remove", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "Input")) and (java_a2 == nil or java_is(java_a2, "Input")) end)


function InputToGameKeyMapping:set(input, mappedToInput)
        local id = mappedToInput:getId()
        if id >= 0 and id < (self.platformToGameKeyMapping.n or #self.platformToGameKeyMapping) then
            self.platformToGameKeyMapping[id + 1] = input
        end
end
java_overload(InputToGameKeyMapping, "set", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "Input")) and (java_a2 == nil or java_is(java_a2, "Input")) end)


function InputToGameKeyMapping:getMaxMappable()
        return (self.platformToGameKeyMapping.n or #self.platformToGameKeyMapping)
end
java_overload(InputToGameKeyMapping, "getMaxMappable", 0)


function InputToGameKeyMapping:getReverseInstance(id)
        local list = BasicArrayListD.new()
        local inputFactory = InputFactory.getInstance()
        for index = 0, (self.platformToGameKeyMapping.n or #self.platformToGameKeyMapping) - 1 do
            if self.platformToGameKeyMapping[index + 1]:getId() == id then
                local input = inputFactory:getInstanceById(index)
                if input ~= nil then
                    list:add(input)
                end
            end
        end
        return list
end
java_overload(InputToGameKeyMapping, "getReverseInstance", 1, function(java_a1) return true and type(java_a1) == "number" end)


-- throws Exception
function InputToGameKeyMapping:initGameKey(canvas, gameKey)
        local key = canvas:getKeyCode(gameKey:getId())
        if key < 0 and -key < (self.negativePlatformToGameKeyMapping.n or #self.negativePlatformToGameKeyMapping) then
            self.negativePlatformToGameKeyMapping[-key + 1] = gameKey
        elseif key > 0 then
            if self.platformToGameKeyMapping[key + 1] == self.gameKeyFactory.NONE then
                self.platformToGameKeyMapping[key + 1] = gameKey
            end
        else
            PreLogUtil.putOE(tostring(StringMaker.new():append(tostring(gameKey)):append(CommonSeps.getInstance().COLON_SEP):appendint(key)), self, self.commonStrings.INIT, require("java.lang.Exception").new())
        end
end
java_overload(InputToGameKeyMapping, "initGameKey", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "Canvas")) and (java_a2 == nil or java_is(java_a2, "GameKey")) end)


-- throws Exception
function InputToGameKeyMapping:getSmallestCanvasGameKeyCode(canvas)
        local nextKey = 0
        local smallestKey = 0
        do
            local index = (self.mappedGameKeys.n or #self.mappedGameKeys)
            while (function() index = index - 1 return index end)() >= 0 do
            nextKey = canvas:getKeyCode(self.mappedGameKeys[index + 1]:getId())
            if nextKey < smallestKey then
                smallestKey = nextKey
            end
            end
        end
        return smallestKey
end
java_overload(InputToGameKeyMapping, "getSmallestCanvasGameKeyCode", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Canvas")) end)


function InputToGameKeyMapping:init(canvas)
        local try_ok, try_error, try_value = pcall(function()
            local negativePlatformToGameKeyMapping = java_new_array(nil, 0)
            local smallestKey = self:getSmallestCanvasGameKeyCode(canvas)
            if smallestKey < 0 then
                smallestKey = smallestKey - 1
                if smallestKey < -256 then
                    smallestKey = -256
                end
                negativePlatformToGameKeyMapping = java_new_array(nil, -smallestKey)
                do
                    local index = (negativePlatformToGameKeyMapping.n or #negativePlatformToGameKeyMapping)
                    while (function() index = index - 1 return index end)() >= 0 do
                    negativePlatformToGameKeyMapping[index + 1] = self.gameKeyFactory.NONE
                    end
                end
                self.negativePlatformToGameKeyMapping = negativePlatformToGameKeyMapping
            end
            do
                local index = (self.mappedGameKeys.n or #self.mappedGameKeys)
                while (function() index = index - 1 return index end)() >= 0 do
                self:initGameKey(canvas, self.mappedGameKeys[index + 1])
                end
            end
        end)
        if not try_ok then
            local t = try_error
            if type(t) ~= "table" then t = require("java.lang.RuntimeException").new(tostring(t)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.INIT, t)
        end
end
java_overload(InputToGameKeyMapping, "init", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Canvas")) end)


function InputToGameKeyMapping:getInstanceForCanvas(canvas, id)
        if id >= 0 and id < (self.platformToGameKeyMapping.n or #self.platformToGameKeyMapping) then
            return self.platformToGameKeyMapping[id + 1]
        elseif id < 0 and -id < (self.negativePlatformToGameKeyMapping.n or #self.negativePlatformToGameKeyMapping) then
            return self.negativePlatformToGameKeyMapping[-id + 1]
        else
            return self.gameKeyFactory.NONE
        end
end
java_overload(InputToGameKeyMapping, "getInstanceForCanvas", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "Canvas")) and type(java_a2) == "number" end)


function InputToGameKeyMapping:getInstance(id)
        if id >= 0 and id < (self.platformToGameKeyMapping.n or #self.platformToGameKeyMapping) then
            return self.platformToGameKeyMapping[id + 1]
        elseif id < 0 and -id < (self.negativePlatformToGameKeyMapping.n or #self.negativePlatformToGameKeyMapping) then
            return self.negativePlatformToGameKeyMapping[-id + 1]
        else
            return self.gameKeyFactory.NONE
        end
end
java_overload(InputToGameKeyMapping, "getInstance", 1, function(java_a1) return true and type(java_a1) == "number" end)

InputToGameKeyMapping.instance_f = NullUtil.getInstance().NULL_OBJECT

return InputToGameKeyMapping

