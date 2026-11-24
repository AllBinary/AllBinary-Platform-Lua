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
-- package org.allbinary.input.automation.actions.script.condition.processors.input

local BasicProfileActionScriptInput = {}
package.loaded["org.allbinary.input.automation.actions.script.condition.processors.input.BasicProfileActionScriptInput"] = BasicProfileActionScriptInput

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
local Iterator = java_lazy("java.util.Iterator")
-- local Set = require("java.util.Set")
local DomNodeHelper = java_lazy("org.allbinary.data.tree.dom.DomNodeHelper")
local DomSearchHelper = java_lazy("org.allbinary.data.tree.dom.DomSearchHelper")
local ModDomHelper = java_lazy("org.allbinary.data.tree.dom.ModDomHelper")
local BasicProfileActionScriptProcessor = require("org.allbinary.input.automation.actions.script.condition.processors.BasicProfileActionScriptProcessor")
local InputRobotFactory = java_lazy("org.allbinary.input.automation.robot.InputRobotFactory")
local InputRobotInterface = java_lazy("org.allbinary.input.automation.robot.InputRobotInterface")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local ProfileActionScriptInputInterface = require("org.allbinary.input.automation.actions.script.condition.processors.input.ProfileActionScriptInputInterface")
local GenericProfileActionScriptInputData = java_lazy("org.allbinary.input.automation.actions.script.condition.processors.input.GenericProfileActionScriptInputData")

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

-- class table BasicProfileActionScriptInput is declared before the requires
BasicProfileActionScriptInput.__index = BasicProfileActionScriptInput
BasicProfileActionScriptInput.className = "BasicProfileActionScriptInput"
BasicProfileActionScriptInput.javaClassName = "org.allbinary.input.automation.actions.script.condition.processors.input.BasicProfileActionScriptInput"
setmetatable(BasicProfileActionScriptInput, {__index = BasicProfileActionScriptProcessor})
BasicProfileActionScriptInput.java_implements = " ProfileActionScriptInputInterface "
BasicProfileActionScriptInput.java_interfaces = function() return {ProfileActionScriptInputInterface} end

function BasicProfileActionScriptInput:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.inputRobotInterface == nil then self.inputRobotInterface = nil end
    if self.time == nil then self.time = 0 end
end

function BasicProfileActionScriptInput._jinit(self, ...)
    local count = select("#", ...)
    if count == 2 then return BasicProfileActionScriptInput._new2(self, ...)
    elseif count == 1 then return BasicProfileActionScriptInput._new1(self, ...)
    end
    error("No constructor of BasicProfileActionScriptInput takes " .. count .. " arguments")
end

function BasicProfileActionScriptInput.new(...)
    local self = setmetatable({}, BasicProfileActionScriptInput)
    BasicProfileActionScriptInput._jinit(self, ...)
    return self
end


function BasicProfileActionScriptInput._new2(self, label, node)
    java_super_init(BasicProfileActionScriptProcessor, self, label, node)
    BasicProfileActionScriptInput._init_fields(self)
        -- super(...) made self above
        self.logUtil:putF(tostring(self.commonStrings.START) .. label, self, self.commonStrings.CONSTRUCTOR)
        local actionNode = DomSearchHelper.getNode(GenericProfileActionScriptInputData.TYPE, node:getChildNodes())
        local inputTypeString = DomNodeHelper.getTextNodeValue(actionNode)
        local timeNode = DomSearchHelper.getNodeNoThrow(GenericProfileActionScriptInputData.DELAY, node:getChildNodes())
        if timeNode ~= nil then
            local delayString = DomNodeHelper.getTextNodeValue(timeNode)
            self:setTime(math.tointeger(tostring(delayString) // 1))
        else
            self:setTime(0)
        end
        self:setInputRobotInterface(InputRobotFactory.getInstance():get(inputTypeString))
    return self
end


function BasicProfileActionScriptInput._new1(self, label)
    java_super_init(BasicProfileActionScriptProcessor, self, label)
    BasicProfileActionScriptInput._init_fields(self)
        -- super(...) made self above
        self.logUtil:putF(tostring(self.commonStrings.START) .. label, self, self.commonStrings.CONSTRUCTOR)
        local inputRobotFactory = InputRobotFactory.getInstance()
        local hashtable = inputRobotFactory:get()
        local set = hashtable:keySet()
        local iterator = set:iterator()
        self:setInputRobotInterface(inputRobotFactory:get(iterator:next()))
        self:setTime(0)
    return self
end


function BasicProfileActionScriptInput:getTime()
        return self.time
end
java_overload(BasicProfileActionScriptInput, "getTime", 0)


function BasicProfileActionScriptInput:setTime(time)
        self.time = time
end
java_overload(BasicProfileActionScriptInput, "setTime", 1, function(java_a1) return true and type(java_a1) == "number" end)


function BasicProfileActionScriptInput:BasicProfileActionScriptInput_toHashMap()
        local hashMap = StdUtil.getInstance():createHashMap()
        hashMap:put(GenericProfileActionScriptInputData.TYPE, self:getInputRobotInterface():getName())
        hashMap:put(GenericProfileActionScriptInputData.DELAY, tostring(self:getTime()))
        self.logUtil:putF("HashMap: " .. tostring(hashMap), self, "toHashMap()")
        return hashMap
end
java_overload(BasicProfileActionScriptInput, "BasicProfileActionScriptInput_toHashMap", 0)


-- throws Exception
function BasicProfileActionScriptInput:toXmlNode(document)
        local node = ModDomHelper.createNodeWithValueNodes(document, GenericProfileActionScriptInputData.NAME, self:BasicProfileActionScriptInput_toHashMap())
        return node
end
java_overload(BasicProfileActionScriptInput, "toXmlNode", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Document")) end)


function BasicProfileActionScriptInput:setInputRobotInterface(inputRobotInterface)
        self.inputRobotInterface = inputRobotInterface
end
java_overload(BasicProfileActionScriptInput, "setInputRobotInterface", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "InputRobotInterface")) end)


function BasicProfileActionScriptInput:getInputRobotInterface()
        return self.inputRobotInterface
end
java_overload(BasicProfileActionScriptInput, "getInputRobotInterface", 0)


function BasicProfileActionScriptInput:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(tostring(BasicProfileActionScriptProcessor))
        stringBuffer:append(" Input Type: ")
        if self:getInputRobotInterface() ~= nil then
            stringBuffer:append(self:getInputRobotInterface():getName())
        else
            stringBuffer:append(StringUtil.getInstance().NULL_STRING)
        end
        stringBuffer:append(" Time: ")
        stringBuffer:appendlong(self:getTime())
        return tostring(stringBuffer)
end
java_overload(BasicProfileActionScriptInput, "toString", 0)
BasicProfileActionScriptInput.__tostring = function(self) return self:toString() end

return BasicProfileActionScriptInput

