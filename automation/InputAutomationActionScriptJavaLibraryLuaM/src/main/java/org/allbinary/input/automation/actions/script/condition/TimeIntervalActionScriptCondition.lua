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
-- package org.allbinary.input.automation.actions.script.condition

local TimeIntervalActionScriptCondition = {}
package.loaded["org.allbinary.input.automation.actions.script.condition.TimeIntervalActionScriptCondition"] = TimeIntervalActionScriptCondition

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
local DomNodeHelper = java_lazy("org.allbinary.data.tree.dom.DomNodeHelper")
local DomSearchHelper = java_lazy("org.allbinary.data.tree.dom.DomSearchHelper")
local ModDomHelper = java_lazy("org.allbinary.data.tree.dom.ModDomHelper")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local TimeDelayHelper = java_lazy("org.allbinary.time.TimeDelayHelper")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local NodeList = java_lazy("org.w3c.dom.NodeList")
local BasicProfileActionScriptCondition = require("org.allbinary.input.automation.actions.script.condition.BasicProfileActionScriptCondition")
local TimeIntervalActionScriptConditionInterface = require("org.allbinary.input.automation.actions.script.condition.TimeIntervalActionScriptConditionInterface")
local TimeIntervalActionScriptConditionData = java_lazy("org.allbinary.input.automation.actions.script.condition.TimeIntervalActionScriptConditionData")
local TimeIntervalActionScriptConditionJPanel = java_lazy("org.allbinary.input.automation.actions.script.condition.TimeIntervalActionScriptConditionJPanel")

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

-- class table TimeIntervalActionScriptCondition is declared before the requires
TimeIntervalActionScriptCondition.__index = TimeIntervalActionScriptCondition
TimeIntervalActionScriptCondition.className = "TimeIntervalActionScriptCondition"
TimeIntervalActionScriptCondition.javaClassName = "org.allbinary.input.automation.actions.script.condition.TimeIntervalActionScriptCondition"
setmetatable(TimeIntervalActionScriptCondition, {__index = BasicProfileActionScriptCondition})
TimeIntervalActionScriptCondition.java_implements = " TimeIntervalActionScriptConditionInterface "
TimeIntervalActionScriptCondition.java_interfaces = function() return {TimeIntervalActionScriptConditionInterface} end

function TimeIntervalActionScriptCondition:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.timeIntervalActionScriptConditionJPanel == nil then self.timeIntervalActionScriptConditionJPanel = nil end
    if self.timeHelper == nil then self.timeHelper = nil end
end

function TimeIntervalActionScriptCondition._jinit(self, ...)
    local count = select("#", ...)
    if count == 1 then return TimeIntervalActionScriptCondition._new1(self, ...)
    elseif count == 0 then return TimeIntervalActionScriptCondition._new0(self, ...)
    end
    error("No constructor of TimeIntervalActionScriptCondition takes " .. count .. " arguments")
end

function TimeIntervalActionScriptCondition.new(...)
    local self = setmetatable({}, TimeIntervalActionScriptCondition)
    TimeIntervalActionScriptCondition._jinit(self, ...)
    return self
end


function TimeIntervalActionScriptCondition._new1(self, node)
    java_super_init(BasicProfileActionScriptCondition, self, TimeIntervalActionScriptCondition.NAME, node)
    TimeIntervalActionScriptCondition._init_fields(self)
        -- super(...) made self above
        local actionNode = DomSearchHelper.getNode(TimeIntervalActionScriptConditionData.NAME, node:getChildNodes())
        if not rawequal(actionNode, nil) then
            local nodeList = actionNode:getChildNodes()
            for index = 0, nodeList:getLength() - 1 do
                local childNode = nodeList:item(index)
                if rawequal(childNode:getNodeName():compareTo(TimeIntervalActionScriptConditionData.TIME), 0) then
                    local interval = DomNodeHelper.getTextNodeValue(childNode)
                    self:setTimeDelayHelper(TimeDelayHelper.new(tostring(interval)))
                else
                    error(require("java.lang.Exception").new("Time Interval Action Script Condition Unknown Node"), 0)
                end
            end
        else
            error(require("java.lang.Exception").new("Time Interval Action Script Condition Node Null"), 0)
        end
        self:init()
    return self
end


function TimeIntervalActionScriptCondition._new0(self)
    java_super_init(BasicProfileActionScriptCondition, self, TimeIntervalActionScriptCondition.NAME)
    TimeIntervalActionScriptCondition._init_fields(self)
        -- super(...) made self above
        self:setTimeDelayHelper(TimeDelayHelper.new(0))
        self:init()
    return self
end


function TimeIntervalActionScriptCondition:init()
        self.timeIntervalActionScriptConditionJPanel = TimeIntervalActionScriptConditionJPanel.new(self)
end
java_overload(TimeIntervalActionScriptCondition, "init", 0)


function TimeIntervalActionScriptCondition:showDialog()
        self.timeIntervalActionScriptConditionJPanel:getTimeIntervalActionJDialog():setVisible(true)
end
java_overload(TimeIntervalActionScriptCondition, "showDialog", 0)


function TimeIntervalActionScriptCondition:toHashMap()
        local hashMap = StdUtil.getInstance():createHashMap()
        hashMap:put(TimeIntervalActionScriptConditionData.TIME, tostring(self.timeHelper.delay))
        self.logUtil:putF(require("allbinary_java").to_string("HashMap: ") .. require("allbinary_java").to_string(tostring(hashMap)), self, "toHashMap()")
        return hashMap
end
java_overload(TimeIntervalActionScriptCondition, "toHashMap", 0)


-- throws Exception
function TimeIntervalActionScriptCondition:toXmlNode(document)
        local node = java_super(BasicProfileActionScriptCondition, "toXmlNode", 1)(self, document)
        node:appendChild(ModDomHelper.createNodeWithValueNodes(document, TimeIntervalActionScriptConditionData.NAME, self:toHashMap()))
        return node
end
java_overload(TimeIntervalActionScriptCondition, "toXmlNode", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Document")) end)


function TimeIntervalActionScriptCondition:log()
        self.logUtil:putF(require("allbinary_java").to_string("Time Interval: ") .. require("allbinary_java").to_string(self.timeHelper.delay), self, "log")
end
java_overload(TimeIntervalActionScriptCondition, "log", 0)


function TimeIntervalActionScriptCondition:getTimeDelayHelper()
        return self.timeHelper
end
java_overload(TimeIntervalActionScriptCondition, "getTimeDelayHelper", 0)


function TimeIntervalActionScriptCondition:setTimeDelayHelper(timeHelper)
        self.timeHelper = timeHelper
end
java_overload(TimeIntervalActionScriptCondition, "setTimeDelayHelper", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "TimeDelayHelper")) end)


-- throws Exception
function TimeIntervalActionScriptCondition:shouldProcess(frame)
        local timeHelper = self:getTimeDelayHelper()
        if timeHelper:isTimeTNT() then
            timeHelper:setStartTimeTNT()
            return java_super(BasicProfileActionScriptCondition, "shouldProcess", 1)(self, frame)
        end
        return false
end
java_overload(TimeIntervalActionScriptCondition, "shouldProcess", 1, function(java_a1) return true and (java_a1 == nil or math.type(java_a1) == "integer") end)

TimeIntervalActionScriptCondition.NAME = "Time Interval"

return TimeIntervalActionScriptCondition

