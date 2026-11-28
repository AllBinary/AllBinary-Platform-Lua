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
-- package org.allbinary.input.automation.module.generic.configuration.profile.actions.script

local GenericProfileActionScript = {}
package.loaded["org.allbinary.input.automation.module.generic.configuration.profile.actions.script.GenericProfileActionScript"] = GenericProfileActionScript

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
-- local DefaultMutableTreeNode = require("javax.swing.tree.DefaultMutableTreeNode")
local DomSearchHelper = java_lazy("org.allbinary.data.tree.dom.DomSearchHelper")
local ProfileActionScriptNodeInterface = java_lazy("org.allbinary.input.automation.actions.script.ProfileActionScriptNodeInterface")
local ProfileActionScriptConditionFactory = java_lazy("org.allbinary.input.automation.actions.script.condition.ProfileActionScriptConditionFactory")
local ProfileActionScriptConditionInterface = java_lazy("org.allbinary.input.automation.actions.script.condition.ProfileActionScriptConditionInterface")
local GenericProfileActionData = java_lazy("org.allbinary.input.automation.module.generic.configuration.profile.actions.GenericProfileActionData")
local GenericProfileActionJPanel = java_lazy("org.allbinary.input.automation.module.generic.configuration.profile.actions.GenericProfileActionJPanel")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local NodeList = java_lazy("org.w3c.dom.NodeList")

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

-- class table GenericProfileActionScript is declared before the requires
GenericProfileActionScript.__index = GenericProfileActionScript
GenericProfileActionScript.className = "GenericProfileActionScript"
GenericProfileActionScript.javaClassName = "org.allbinary.input.automation.module.generic.configuration.profile.actions.script.GenericProfileActionScript"
setmetatable(GenericProfileActionScript, {__index = DefaultMutableTreeNode})
GenericProfileActionScript.java_implements = " ProfileActionScriptNodeInterface "
GenericProfileActionScript.java_interfaces = function() return {ProfileActionScriptNodeInterface} end

function GenericProfileActionScript:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.genericProfileActionJPanel == nil then self.genericProfileActionJPanel = nil end
    if self.profileActionConditionInterfaceVector == nil then self.profileActionConditionInterfaceVector = nil end
end

function GenericProfileActionScript._jinit(self, ...)
    local count = select("#", ...)
    if count == 2 then return GenericProfileActionScript._new2(self, ...)
    elseif count == 1 then return GenericProfileActionScript._new1(self, ...)
    end
    error("No constructor of GenericProfileActionScript takes " .. count .. " arguments")
end

function GenericProfileActionScript.new(...)
    local self = setmetatable({}, GenericProfileActionScript)
    GenericProfileActionScript._jinit(self, ...)
    return self
end


function GenericProfileActionScript._new2(self, genericProfileActionJPanel, node)
    java_super_init(DefaultMutableTreeNode, self, GenericProfileActionScript.NAME)
    GenericProfileActionScript._init_fields(self)
        -- super(...) made self above
        self.genericProfileActionJPanel = genericProfileActionJPanel
        self:setProfileActionConditionInterfaceVector(BasicArrayListD.new())
        local actionScriptNode = DomSearchHelper.getNode(GenericProfileActionData.SCRIPT, node:getChildNodes())
        if not rawequal(actionScriptNode, nil) then
            local nodeList = actionScriptNode:getChildNodes()
            for index = 0, nodeList:getLength() - 1 do
                local actionConditionNode = nodeList:item(index)
                if rawequal(actionConditionNode:getNodeType(), Node.ELEMENT_NODE) then
                    self:addCondition(ProfileActionScriptConditionFactory.getInstance(actionConditionNode))
                end
            end
        else
            error(require("java.lang.Exception").new("Profile Action Script Node Null"), 0)
        end
    return self
end


function GenericProfileActionScript._new1(self, genericProfileActionJPanel)
    java_super_init(DefaultMutableTreeNode, self)
    GenericProfileActionScript._init_fields(self)
        self.genericProfileActionJPanel = genericProfileActionJPanel
        self:setProfileActionConditionInterfaceVector(BasicArrayListD.new())
    return self
end


function GenericProfileActionScript:addCondition(profileActionScriptNodeInterface)
        self.logUtil:putF(self.commonStrings.START, self, "addCondition")
        self:getProfileActionConditionInterfaceVector():add(profileActionScriptNodeInterface)
        self:add(profileActionScriptNodeInterface)
end
java_overload(GenericProfileActionScript, "addCondition", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ProfileActionScriptNodeInterface")) end)


function GenericProfileActionScript:removeCondition(profileActionScriptNodeInterface)
        self.logUtil:putF(self.commonStrings.START, self, "removeCondition")
        self:getProfileActionConditionInterfaceVector():remove(profileActionScriptNodeInterface)
        self:remove(profileActionScriptNodeInterface)
end
java_overload(GenericProfileActionScript, "removeCondition", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ProfileActionScriptNodeInterface")) end)


function GenericProfileActionScript:toHashMap()
        local hashMap = StdUtil.getInstance():createHashMap()
        self.logUtil:putF(require("allbinary_java").to_string("HashMap: ") .. require("allbinary_java").to_string(tostring(hashMap)), self, "toHashMap()")
        return hashMap
end
java_overload(GenericProfileActionScript, "toHashMap", 0)


function GenericProfileActionScript:getProfileActionConditionInterfaceVector()
        return self.profileActionConditionInterfaceVector
end
java_overload(GenericProfileActionScript, "getProfileActionConditionInterfaceVector", 0)


function GenericProfileActionScript:setProfileActionConditionInterfaceVector(profileActionConditionInterfaceVector)
        self.profileActionConditionInterfaceVector = profileActionConditionInterfaceVector
end
java_overload(GenericProfileActionScript, "setProfileActionConditionInterfaceVector", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "BasicArrayList")) end)


-- throws Exception
function GenericProfileActionScript:toXmlNode(document)
        local node = document:createElement(GenericProfileActionData.SCRIPT)
        local vector = self:getProfileActionConditionInterfaceVector()
        local size = vector:size()
        for index = 0, size - 1 do
            local profileActionConditionInterface = vector:get(index)
            node:appendChild(profileActionConditionInterface:toXmlNode(document))
        end
        return node
end
java_overload(GenericProfileActionScript, "toXmlNode", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Document")) end)

GenericProfileActionScript.NAME = "Root"

return GenericProfileActionScript

