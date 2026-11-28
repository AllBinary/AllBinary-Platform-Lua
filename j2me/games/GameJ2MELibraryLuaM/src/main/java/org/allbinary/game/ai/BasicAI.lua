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
-- package org.allbinary.game.ai

local BasicAI = {}
package.loaded["org.allbinary.game.ai.BasicAI"] = BasicAI

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

local ArtificialIntelligence = require("org.allbinary.ai.ArtificialIntelligence")
local CanvasUtil = java_lazy("org.allbinary.game.displayable.canvas.CanvasUtil")
local GameInput = java_lazy("org.allbinary.game.input.GameInput")
local GameKeyEventSourceInterface = java_lazy("org.allbinary.game.input.GameKeyEventSourceInterface")
local GameKeyEventFactory = java_lazy("org.allbinary.game.input.event.GameKeyEventFactory")
local AllBinaryLayer = java_lazy("org.allbinary.layer.AllBinaryLayer")
local AllBinaryLayerManager = java_lazy("org.allbinary.layer.AllBinaryLayerManager")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local SmallIntegerSingletonFactory = java_lazy("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")

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

-- class table BasicAI is declared before the requires
BasicAI.__index = BasicAI
BasicAI.className = "BasicAI"
BasicAI.javaClassName = "org.allbinary.game.ai.BasicAI"
setmetatable(BasicAI, {__index = ArtificialIntelligence})
BasicAI.java_implements = " GameKeyEventSourceInterface "
BasicAI.java_interfaces = function() return {GameKeyEventSourceInterface} end

function BasicAI:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.gameKeyEventFactory = GameKeyEventFactory.getInstance()
    if self.ownerLayerInterface == nil then self.ownerLayerInterface = nil end
    if self.gameInput == nil then self.gameInput = nil end
    self.lastKey = -1
end


function BasicAI._jinit(self, ownerLayerInterface, gameInput)
    java_super_init(ArtificialIntelligence, self)
    BasicAI._init_fields(self)
        self.ownerLayerInterface = ownerLayerInterface
        self.gameInput = gameInput
    return self
end

function BasicAI.new(...)
    local self = setmetatable({}, BasicAI)
    BasicAI._jinit(self, ...)
    return self
end


-- throws Exception
function BasicAI:processAI(allBinaryLayerManager)
        error(require("java.lang.Exception").new(self.commonStrings.NOT_IMPLEMENTED), 0)
end
java_overload(BasicAI, "processAI", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryLayerManager")) end)


-- throws Exception
function BasicAI:processKeyAI(key)
        if not rawequal(key, -1) then
            self.gameInput:add(self.gameKeyEventFactory:getInstanceForKey(self, key))
        end
end
java_overload(BasicAI, "processKeyAI", 1, function(java_a1) return true and type(java_a1) == "number" end)


function BasicAI:setLastKey(lastKey)
        self.lastKey = lastKey
end
java_overload(BasicAI, "setLastKey", 1, function(java_a1) return true and type(java_a1) == "number" end)


function BasicAI:getLastKey()
        return self.lastKey
end
java_overload(BasicAI, "getLastKey", 0)


function BasicAI:getOwnerLayerInterface()
        return self.ownerLayerInterface
end
java_overload(BasicAI, "getOwnerLayerInterface", 0)


function BasicAI:getGameInput()
        return self.gameInput
end
java_overload(BasicAI, "getGameInput", 0)


function BasicAI:getName()
        return (getmetatable(self).javaClassName or getmetatable(self).className)
end
java_overload(BasicAI, "getName", 0)


function BasicAI:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(CommonSeps.getInstance().NEW_LINE)
        stringBuffer:append(self:getName())
        stringBuffer:append(" LastKey: ")
        stringBuffer:append(CanvasUtil.getKeyName(self:getLastKey()))
        return tostring(stringBuffer)
end
java_overload(BasicAI, "toString", 0)
BasicAI.__tostring = function(self) return self:toString() end


function BasicAI:getSourceId()
        return 1
end
java_overload(BasicAI, "getSourceId", 0)

BasicAI.AI_VISITOR = SmallIntegerSingletonFactory.getInstance():getAt(2)
BasicAI.ID = SmallIntegerSingletonFactory.getInstance():getAt(1)

return BasicAI

