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
-- package org.allbinary.input.automation.module.generic.configuration.profile.actions

local GenericProfileAction = {}
package.loaded["org.allbinary.input.automation.module.generic.configuration.profile.actions.GenericProfileAction"] = GenericProfileAction

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
local DomNodeInterface = java_lazy("org.allbinary.data.tree.dom.DomNodeInterface")
local DomSearchHelper = java_lazy("org.allbinary.data.tree.dom.DomSearchHelper")
local ModDomHelper = java_lazy("org.allbinary.data.tree.dom.ModDomHelper")
local GenericProfileActionScript = java_lazy("org.allbinary.input.automation.module.generic.configuration.profile.actions.script.GenericProfileActionScript")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local GenericProfileActionData = java_lazy("org.allbinary.input.automation.module.generic.configuration.profile.actions.GenericProfileActionData")
local GenericProfileActionJPanel = java_lazy("org.allbinary.input.automation.module.generic.configuration.profile.actions.GenericProfileActionJPanel")

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

-- class table GenericProfileAction is declared before the requires
GenericProfileAction.__index = GenericProfileAction
GenericProfileAction.className = "GenericProfileAction"
GenericProfileAction.javaClassName = "org.allbinary.input.automation.module.generic.configuration.profile.actions.GenericProfileAction"
GenericProfileAction.java_implements = " DomNodeInterface "
GenericProfileAction.java_interfaces = function() return {DomNodeInterface} end

function GenericProfileAction:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.name_f == nil then self.name_f = nil end
    if self.genericProfileActionScript == nil then self.genericProfileActionScript = nil end
    if self.genericProfileActionJPanel == nil then self.genericProfileActionJPanel = nil end
end

function GenericProfileAction._jinit(self, ...)
    local count = select("#", ...)
    if count == 2 then return GenericProfileAction._new2(self, ...)
    elseif count == 1 then return GenericProfileAction._new1(self, ...)
    end
    error("No constructor of GenericProfileAction takes " .. count .. " arguments")
end

function GenericProfileAction.new(...)
    local self = setmetatable({}, GenericProfileAction)
    GenericProfileAction._jinit(self, ...)
    return self
end


function GenericProfileAction._new2(self, genericProfileActionJPanel, node)
    GenericProfileAction._init_fields(self)
        local actionNameNode = DomSearchHelper.getNode(GenericProfileActionData.NAME, node:getChildNodes())
        if actionNameNode ~= nil then
            self.name_f = DomNodeHelper.getTextNodeValue(actionNameNode)
        else
            error(require("java.lang.Exception").new("Profile Action Name Node Null"), 0)
        end
        self:setGenericProfileActionScript(GenericProfileActionScript.new(self.genericProfileActionJPanel, node))
    return self
end


function GenericProfileAction._new1(self, name)
    GenericProfileAction._init_fields(self)
        self.name_f = name
        self:setGenericProfileActionScript(GenericProfileActionScript.new(self.genericProfileActionJPanel))
    return self
end


function GenericProfileAction:getName()
        return self.name_f
end


function GenericProfileAction:setName(name)
        self.name_f = name
end


function GenericProfileAction:toHashMap()
        local hashMap = StdUtil.getInstance():createHashMap()
        hashMap:put(GenericProfileActionData.NAME, self.name_f)
        self.logUtil:putF("HashMap: " .. tostring(hashMap), self, "toHashMap()")
        return hashMap
end


-- throws Exception
function GenericProfileAction:toXmlNode(document)
        local node = ModDomHelper.createNodeWithValueNodes(document, GenericProfileActionData.NAME, self:toHashMap())
        node:appendChild(self:getGenericProfileActionScript():toXmlNode(document))
        return node
end


function GenericProfileAction:getGenericProfileActionScript()
        return self.genericProfileActionScript
end


function GenericProfileAction:setGenericProfileActionScript(genericProfileActionScript)
        self.genericProfileActionScript = genericProfileActionScript
end

return GenericProfileAction

