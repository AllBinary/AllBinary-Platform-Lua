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

local KeyboardActionScriptInput = {}
package.loaded["org.allbinary.input.automation.actions.script.condition.processors.input.KeyboardActionScriptInput"] = KeyboardActionScriptInput

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

-- local KeyEvent = require("java.awt.event.KeyEvent")
local HashMap = java_lazy("java.util.HashMap")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local DomNodeHelper = java_lazy("org.allbinary.data.tree.dom.DomNodeHelper")
local DomSearchHelper = java_lazy("org.allbinary.data.tree.dom.DomSearchHelper")
local ModDomHelper = java_lazy("org.allbinary.data.tree.dom.ModDomHelper")
local KeySingletonFactory = java_lazy("org.allbinary.input.KeySingletonFactory")
local KeyUtil = java_lazy("org.allbinary.input.KeyUtil")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local NodeList = java_lazy("org.w3c.dom.NodeList")
local BasicProfileActionScriptInput = require("org.allbinary.input.automation.actions.script.condition.processors.input.BasicProfileActionScriptInput")
local KeyboardActionScriptInputInterface = require("org.allbinary.input.automation.actions.script.condition.processors.input.KeyboardActionScriptInputInterface")
local KeyboardActionScriptInputData = java_lazy("org.allbinary.input.automation.actions.script.condition.processors.input.KeyboardActionScriptInputData")
local KeyboardActionScriptInputJPanel = java_lazy("org.allbinary.input.automation.actions.script.condition.processors.input.KeyboardActionScriptInputJPanel")
local KeyboardInputAutomationProcessor = java_lazy("org.allbinary.input.automation.actions.script.condition.processors.input.KeyboardInputAutomationProcessor")

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

-- class table KeyboardActionScriptInput is declared before the requires
KeyboardActionScriptInput.__index = KeyboardActionScriptInput
KeyboardActionScriptInput.className = "KeyboardActionScriptInput"
KeyboardActionScriptInput.javaClassName = "org.allbinary.input.automation.actions.script.condition.processors.input.KeyboardActionScriptInput"
setmetatable(KeyboardActionScriptInput, {__index = BasicProfileActionScriptInput})
KeyboardActionScriptInput.java_implements = " KeyboardActionScriptInputInterface "
KeyboardActionScriptInput.java_interfaces = function() return {KeyboardActionScriptInputInterface} end

function KeyboardActionScriptInput:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.keyArray = {KeySingletonFactory.getInstance(KeyEvent.VK_0)}
    if self.keyboardActionScriptInputJPanel == nil then self.keyboardActionScriptInputJPanel = nil end
    if self.press == nil then self.press = false end
    if self.release == nil then self.release = false end
    if self.delayBetweenKeys == nil then self.delayBetweenKeys = 0 end
end

function KeyboardActionScriptInput._jinit(self, ...)
    local count = select("#", ...)
    if count == 1 then return KeyboardActionScriptInput._new1(self, ...)
    elseif count == 0 then return KeyboardActionScriptInput._new0(self, ...)
    end
    error("No constructor of KeyboardActionScriptInput takes " .. count .. " arguments")
end

function KeyboardActionScriptInput.new(...)
    local self = setmetatable({}, KeyboardActionScriptInput)
    KeyboardActionScriptInput._jinit(self, ...)
    return self
end


function KeyboardActionScriptInput._new1(self, node)
    java_super_init(BasicProfileActionScriptInput, self, KeyboardActionScriptInput.NAME, node)
    KeyboardActionScriptInput._init_fields(self)
        -- super(...) made self above
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        local actionNode = DomSearchHelper.getNode(KeyboardActionScriptInputData.NAME, node:getChildNodes())
        if actionNode ~= nil then
            local nodeList = actionNode:getChildNodes()
            local vector = BasicArrayListD.new()
            for index = 0, nodeList:getLength() - 1 do
                local childNode = nodeList:item(index)
                if childNode:getNodeName():startsWith(KeyboardActionScriptInputData.KEY) then
                    local keyString = DomNodeHelper.getTextNodeValue(childNode)
                    vector:add(tostring(keyString))
                elseif childNode:getNodeName():compareTo(KeyboardActionScriptInputData.DELAY_BETWEEN_KEYS) == 0 then
                    local time = DomNodeHelper.getTextNodeValue(childNode)
                    self:setDelayBetweenKeys(math.tointeger(tostring(time) // 1))
                elseif childNode:getNodeName():compareTo(KeyboardActionScriptInputData.PRESS) == 0 then
                    local value = DomNodeHelper.getTextNodeValue(childNode)
                    self:setPress(tostring(value))
                elseif childNode:getNodeName():compareTo(KeyboardActionScriptInputData.RELEASE) == 0 then
                    local value = DomNodeHelper.getTextNodeValue(childNode)
                    self:setRelease(tostring(value))
                else
                    error(require("java.lang.Exception").new("Action Script Input Unknown Node"), 0)
                end
            end
            self:setKeyArray(vector:toArrayType(java_new_array(nil, vector:size())))
        else
            error(require("java.lang.Exception").new("Action Script Input Node Null"), 0)
        end
        self:setAllowsChildren(false)
        if not self:isPress() and not self:isRelease() then
            self:setNormal()
        end
        self.keyboardActionScriptInputJPanel = KeyboardActionScriptInputJPanel.new(self)
    return self
end


function KeyboardActionScriptInput._new0(self)
    java_super_init(BasicProfileActionScriptInput, self, KeyboardActionScriptInput.NAME)
    KeyboardActionScriptInput._init_fields(self)
        -- super(...) made self above
        if not self:isPress() and not self:isRelease() then
            self:setNormal()
        end
        self:setAllowsChildren(false)
        self:setTime(120)
        self.keyboardActionScriptInputJPanel = KeyboardActionScriptInputJPanel.new(self)
    return self
end


function KeyboardActionScriptInput:getDelayBetweenKeys()
        return self.delayBetweenKeys
end
java_overload(KeyboardActionScriptInput, "getDelayBetweenKeys", 0)


function KeyboardActionScriptInput:setDelayBetweenKeys(delayBetweenKeys)
        self.delayBetweenKeys = delayBetweenKeys
end
java_overload(KeyboardActionScriptInput, "setDelayBetweenKeys", 1, function(java_a1) return true and type(java_a1) == "number" end)


function KeyboardActionScriptInput:isPress()
        return self.press
end
java_overload(KeyboardActionScriptInput, "isPress", 0)


function KeyboardActionScriptInput:setPress(press)
        self.press = press
end
java_overload(KeyboardActionScriptInput, "setPress", 1, function(java_a1) return true and type(java_a1) == "boolean" end)


function KeyboardActionScriptInput:isRelease()
        return self.release
end
java_overload(KeyboardActionScriptInput, "isRelease", 0)


function KeyboardActionScriptInput:setRelease(release)
        self.release = release
end
java_overload(KeyboardActionScriptInput, "setRelease", 1, function(java_a1) return true and type(java_a1) == "boolean" end)


function KeyboardActionScriptInput:isNormal()
        return self:isRelease() and self:isPress()
end
java_overload(KeyboardActionScriptInput, "isNormal", 0)


function KeyboardActionScriptInput:setNormal()
        self:setPress(true)
        self:setRelease(true)
end
java_overload(KeyboardActionScriptInput, "setNormal", 0)


function KeyboardActionScriptInput:getKeyArray()
        return self.keyArray
end
java_overload(KeyboardActionScriptInput, "getKeyArray", 0)


function KeyboardActionScriptInput:setKeyArray(keyArray)
        if keyArray ~= nil then
            self.logUtil:putF(CommonLabels.getInstance().START + (keyArray.n or #keyArray), self, "setKeyArray")
        end
        self.keyArray = keyArray
end
java_overload(KeyboardActionScriptInput, "setKeyArray", 1, function(java_a1) return true and (java_a1 == nil or (type(java_a1) == "table" and getmetatable(java_a1) == nil and java_a1.jt == nil and (java_a1[1] == nil or type(java_a1[1]) == "table"))) end)


function KeyboardActionScriptInput:showDialog()
        self.keyboardActionScriptInputJPanel:getKeyActionJDialog():setVisible(true)
end
java_overload(KeyboardActionScriptInput, "showDialog", 0)


function KeyboardActionScriptInput:getText()
        return self:getText(self:getKeyArray())
end
java_overload(KeyboardActionScriptInput, "getText", 0)


function KeyboardActionScriptInput:setText(text)
        self.logUtil:putF(tostring(CommonLabels.getInstance().START) .. text, self, "setText")
        local integerArray = self:integerArrayValue(text)
        self:setKeyArray(integerArray)
end
java_overload(KeyboardActionScriptInput, "setText", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function KeyboardActionScriptInput.getText(integerArray)
        local index = 0
        local stringBuffer = StringMaker.new()
        while index < (integerArray.n or #integerArray) do
            local nextInteger = integerArray[index + 1]
            if KeyUtil.isNormallyDisplayed(nextInteger) then
                stringBuffer:append(KeyEvent.getKeyText(nextInteger))
            else
                stringBuffer:append("&#" .. tostring(nextInteger) .. ";")
            end
            index = index + 1
        end
        return tostring(stringBuffer)
end


function KeyboardActionScriptInput:integerArrayValue(text)
        self.logUtil:putF(tostring(CommonLabels.getInstance().START) .. text, self, "integerArrayValue")
        local vector = BasicArrayListD.new()
        local index = 0
        while index < #text do
            do
            local aChar = string.sub(text, (index) + 1, (index) + 1)
            if aChar == "&" then
                if string.sub(text, (index + 1) + 1, (index + 1) + 1) == "#" then
                    local endIndex = ((string.find(text, ";", (index + 1) + 1, true) or 0) - 1)
                    if endIndex ~= -1 then
                        local nextCharString = string.sub(text, (index + 2) + 1, endIndex)
                        self.logUtil:putF(tostring(CommonLabels.getInstance().NEXT) .. " Char String: " .. nextCharString, self, "integerArrayValue")
                        vector:add(tostring(string.sub(nextCharString, (index) + 1, #nextCharString)))
                        index = index + #nextCharString + 3
                        goto continue_N69468
                    end
                end
            end
            vector:add(KeySingletonFactory.getHashtable():get(tostring(aChar)))
            index = index + 1
            end
            ::continue_N69468::
        end
        local integerArray = vector:toArrayType(java_new_array(nil, vector:size()))
        return integerArray
end
java_overload(KeyboardActionScriptInput, "integerArrayValue", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function KeyboardActionScriptInput:toHashMap()
        local hashMap = StdUtil.getInstance():createHashMap()
        for index = 0, (self:getKeyArray().n or #self:getKeyArray()) - 1 do
            hashMap:put(KeyboardActionScriptInputData.KEY + index, tostring(self:getKeyArray()[index + 1]))
        end
        hashMap:put(KeyboardActionScriptInputData.DELAY_BETWEEN_KEYS, tostring(self:getDelayBetweenKeys()))
        hashMap:put(KeyboardActionScriptInputData.PRESS, tostring(self:isPress()))
        hashMap:put(KeyboardActionScriptInputData.RELEASE, tostring(self:isRelease()))
        self.logUtil:putF("HashMap: " .. tostring(hashMap), self, "toHashMap()")
        return hashMap
end
java_overload(KeyboardActionScriptInput, "toHashMap", 0)


-- throws Exception
function KeyboardActionScriptInput:toXmlNode(document)
        local node = java_super(BasicProfileActionScriptInput, "toXmlNode", 1)(self, document)
        node:appendChild(ModDomHelper.createNodeWithValueNodes(document, KeyboardActionScriptInputData.NAME, self:toHashMap()))
        return node
end
java_overload(KeyboardActionScriptInput, "toXmlNode", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Document")) end)


-- throws Exception
function KeyboardActionScriptInput:process(frame)
        KeyboardInputAutomationProcessor.process(self)
end
java_overload(KeyboardActionScriptInput, "process", 1, function(java_a1) return true and (java_a1 == nil or math.type(java_a1) == "integer") end)


function KeyboardActionScriptInput:log()
        self.logUtil:putF(tostring(self), self, "log")
end
java_overload(KeyboardActionScriptInput, "log", 0)


function KeyboardActionScriptInput:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(tostring(BasicProfileActionScriptInput))
        stringBuffer:append(" Text: ")
        stringBuffer:append(self:getText())
        stringBuffer:append(" isPress: ")
        stringBuffer:appendboolean(self:isPress())
        stringBuffer:append(" isRelease: ")
        stringBuffer:appendboolean(self:isRelease())
        stringBuffer:append(" Between Key Delay: ")
        stringBuffer:appendint(self:getDelayBetweenKeys())
        return tostring(stringBuffer)
end
java_overload(KeyboardActionScriptInput, "toString", 0)
KeyboardActionScriptInput.__tostring = function(self) return self:toString() end

KeyboardActionScriptInput.NAME = "Keyboard"

return KeyboardActionScriptInput

