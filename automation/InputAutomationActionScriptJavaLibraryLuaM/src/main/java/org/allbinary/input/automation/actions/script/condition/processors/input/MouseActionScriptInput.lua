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

local MouseActionScriptInput = {}
package.loaded["org.allbinary.input.automation.actions.script.condition.processors.input.MouseActionScriptInput"] = MouseActionScriptInput

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

-- local Point = require("java.awt.Point")
-- local InputEvent = require("java.awt.event.InputEvent")
local HashMap = java_lazy("java.util.HashMap")
local DomNodeHelper = java_lazy("org.allbinary.data.tree.dom.DomNodeHelper")
local DomSearchHelper = java_lazy("org.allbinary.data.tree.dom.DomSearchHelper")
local ModDomHelper = java_lazy("org.allbinary.data.tree.dom.ModDomHelper")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local BooleanFactory = java_lazy("org.allbinary.logic.java.bool.BooleanFactory")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local NodeList = java_lazy("org.w3c.dom.NodeList")
local BasicProfileActionScriptInput = require("org.allbinary.input.automation.actions.script.condition.processors.input.BasicProfileActionScriptInput")
local MouseActionScriptInputInterface = require("org.allbinary.input.automation.actions.script.condition.processors.input.MouseActionScriptInputInterface")
local MouseActionScriptInputData = java_lazy("org.allbinary.input.automation.actions.script.condition.processors.input.MouseActionScriptInputData")
local MouseActionScriptInputJPanel = java_lazy("org.allbinary.input.automation.actions.script.condition.processors.input.MouseActionScriptInputJPanel")
local MouseInputAutomationProcessor = java_lazy("org.allbinary.input.automation.actions.script.condition.processors.input.MouseInputAutomationProcessor")

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

-- class table MouseActionScriptInput is declared before the requires
MouseActionScriptInput.__index = MouseActionScriptInput
MouseActionScriptInput.className = "MouseActionScriptInput"
MouseActionScriptInput.javaClassName = "org.allbinary.input.automation.actions.script.condition.processors.input.MouseActionScriptInput"
setmetatable(MouseActionScriptInput, {__index = BasicProfileActionScriptInput})
MouseActionScriptInput.java_implements = " MouseActionScriptInputInterface "
MouseActionScriptInput.java_interfaces = function() return {MouseActionScriptInputInterface} end

function MouseActionScriptInput:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.point == nil then self.point = nil end
    if self.buttons == nil then self.buttons = 0 end
    if self.mouseActionScriptInputJPanel == nil then self.mouseActionScriptInputJPanel = nil end
end

function MouseActionScriptInput._jinit(self, ...)
    local count = select("#", ...)
    if count == 1 then return MouseActionScriptInput._new1(self, ...)
    elseif count == 0 then return MouseActionScriptInput._new0(self, ...)
    end
    error("No constructor of MouseActionScriptInput takes " .. count .. " arguments")
end

function MouseActionScriptInput.new(...)
    local self = setmetatable({}, MouseActionScriptInput)
    MouseActionScriptInput._jinit(self, ...)
    return self
end


function MouseActionScriptInput._new1(self, node)
    java_super_init(BasicProfileActionScriptInput, self, MouseActionScriptInput.NAME, node)
    MouseActionScriptInput._init_fields(self)
        -- super(...) made self above
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        self.point = Point.new()
        local actionNode = DomSearchHelper.getNode(MouseActionScriptInputData.NAME, node:getChildNodes())
        if actionNode ~= nil then
            local nodeList = actionNode:getChildNodes()
            for index = 0, nodeList:getLength() - 1 do
                local childNode = nodeList:item(index)
                if childNode:getNodeName():compareTo(MouseActionScriptInputData.BUTTONS) == 0 then
                    local buttons = DomNodeHelper.getTextNodeValue(childNode)
                    self:setButtonClicks(math.tointeger(tostring(buttons) // 1))
                elseif childNode:getNodeName():compareTo(MouseActionScriptInputData.MOVE) == 0 then
                    local mouseXNode = DomSearchHelper.getNode(MouseActionScriptInputData.MOVE_X, childNode:getChildNodes())
                    local mouseXString = DomNodeHelper.getTextNodeValue(mouseXNode)
                    local mouseXInteger = tostring(mouseXString)
                    local mouseYNode = DomSearchHelper.getNode(MouseActionScriptInputData.MOVE_Y, childNode:getChildNodes())
                    local mouseYString = DomNodeHelper.getTextNodeValue(mouseYNode)
                    local mouseYInteger = tostring(mouseYString)
                    local newPoint = Point.new(math.tointeger(mouseXInteger // 1), math.tointeger(mouseYInteger // 1))
                    self:setPoint(newPoint)
                else
                    error(require("java.lang.Exception").new("Action Script Input Unknown Node"), 0)
                end
            end
        else
            error(require("java.lang.Exception").new("Action Script Input Node Null"), 0)
        end
        self:setAllowsChildren(false)
        self.mouseActionScriptInputJPanel = MouseActionScriptInputJPanel.new(self)
    return self
end


function MouseActionScriptInput._new0(self)
    java_super_init(BasicProfileActionScriptInput, self, MouseActionScriptInput.NAME)
    MouseActionScriptInput._init_fields(self)
        -- super(...) made self above
        self.point = Point.new()
        self:setAllowsChildren(false)
        self.mouseActionScriptInputJPanel = MouseActionScriptInputJPanel.new(self)
    return self
end


function MouseActionScriptInput:setPoint(point)
        self.point = point
end
java_overload(MouseActionScriptInput, "setPoint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Point")) end)


function MouseActionScriptInput:getPoint()
        return self.point
end
java_overload(MouseActionScriptInput, "getPoint", 0)


function MouseActionScriptInput:getButtonClicks()
        return self.buttons
end
java_overload(MouseActionScriptInput, "getButtonClicks", 0)


function MouseActionScriptInput:setButtonClicks(buttons)
        self.buttons = buttons
end
java_overload(MouseActionScriptInput, "setButtonClicks", 1, function(java_a1) return true and type(java_a1) == "number" end)


function MouseActionScriptInput:showDialog()
        self.mouseActionScriptInputJPanel:getMouseActionJDialog():setVisible(true)
end
java_overload(MouseActionScriptInput, "showDialog", 0)


function MouseActionScriptInput:toHashMap()
        local hashMap = StdUtil.getInstance():createHashMap()
        hashMap:put(MouseActionScriptInputData.BUTTONS, tostring(self:getButtonClicks()))
        self.logUtil:putF("HashMap: " .. tostring(hashMap), self, "toHashMap()")
        return hashMap
end
java_overload(MouseActionScriptInput, "toHashMap", 0)


-- throws Exception
function MouseActionScriptInput:toXmlNode(document)
        local node = java_super(BasicProfileActionScriptInput, "toXmlNode", 1)(self, document)
        local mouseNode = ModDomHelper.createNodeWithValueNodes(document, MouseActionScriptInputData.NAME, self:toHashMap())
        node:appendChild(mouseNode)
        local hashMap = StdUtil.getInstance():createHashMap()
        hashMap:put(MouseActionScriptInputData.MOVE_X, tostring(self:getPoint().x))
        hashMap:put(MouseActionScriptInputData.MOVE_Y, tostring(self:getPoint().y))
        mouseNode:appendChild(ModDomHelper.createNodeWithValueNodes(document, MouseActionScriptInputData.MOVE, hashMap))
        return node
end
java_overload(MouseActionScriptInput, "toXmlNode", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Document")) end)


-- throws Exception
function MouseActionScriptInput:process(frame)
        MouseInputAutomationProcessor.process(self)
end
java_overload(MouseActionScriptInput, "process", 1, function(java_a1) return true and (java_a1 == nil or math.type(java_a1) == "integer") end)


function MouseActionScriptInput:log()
        local buttonStringBuffer = StringMaker.new()
        buttonStringBuffer:append("1: ")
        local booleanFactory = BooleanFactory.getInstance()
        if (self:getButtonClicks() & InputEvent.BUTTON1_MASK) ~= 0 then
            buttonStringBuffer:append(booleanFactory.TRUE_STRING)
        else
            buttonStringBuffer:append(booleanFactory.FALSE_STRING)
        end
        buttonStringBuffer:append(" 2: ")
        if (self:getButtonClicks() & InputEvent.BUTTON2_MASK) ~= 0 then
            buttonStringBuffer:append(booleanFactory.TRUE_STRING)
        else
            buttonStringBuffer:append(booleanFactory.FALSE_STRING)
        end
        buttonStringBuffer:append(" 3: ")
        if (self:getButtonClicks() & InputEvent.BUTTON3_MASK) ~= 0 then
            buttonStringBuffer:append(booleanFactory.TRUE_STRING)
        else
            buttonStringBuffer:append(booleanFactory.FALSE_STRING)
        end
        self.logUtil:putF("Input Type: " .. self:getInputRobotInterface():getName() .. " Point: " .. tostring(self:getPoint()) .. " Buttons Clicked: " .. tostring(buttonStringBuffer), self, "log")
end
java_overload(MouseActionScriptInput, "log", 0)

MouseActionScriptInput.NAME = "Mouse"

return MouseActionScriptInput

