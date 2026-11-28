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

local BasicProfileActionScriptCondition = {}
package.loaded["org.allbinary.input.automation.actions.script.condition.BasicProfileActionScriptCondition"] = BasicProfileActionScriptCondition

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

-- local ActionEvent = require("java.awt.event.ActionEvent")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
-- local JMenu = require("javax.swing.JMenu")
-- local JMenuItem = require("javax.swing.JMenuItem")
-- local TreePath = require("javax.swing.tree.TreePath")
local JTreeInterfaceFactory = java_lazy("org.allbinary.input.automation.actions.script.JTreeInterfaceFactory")
local ProfileActionScriptItem = require("org.allbinary.input.automation.actions.script.ProfileActionScriptItem")
local ProfileActionScriptNodeInterface = java_lazy("org.allbinary.input.automation.actions.script.ProfileActionScriptNodeInterface")
local ProfileActionScriptProcessorInterface = java_lazy("org.allbinary.input.automation.actions.script.condition.processors.ProfileActionScriptProcessorInterface")
local GenericProfileActionScriptInputData = java_lazy("org.allbinary.input.automation.actions.script.condition.processors.input.GenericProfileActionScriptInputData")
local KeyboardActionScriptInput = java_lazy("org.allbinary.input.automation.actions.script.condition.processors.input.KeyboardActionScriptInput")
local MouseActionScriptInput = java_lazy("org.allbinary.input.automation.actions.script.condition.processors.input.MouseActionScriptInput")
local ProfileActionScriptInputFactory = java_lazy("org.allbinary.input.automation.actions.script.condition.processors.input.ProfileActionScriptInputFactory")
local GenericProfileActionScriptOutputData = java_lazy("org.allbinary.input.automation.module.actions.script.condition.processors.output.GenericProfileActionScriptOutputData")
local ImageActionScriptOutput = java_lazy("org.allbinary.input.automation.module.actions.script.condition.processors.output.ImageActionScriptOutput")
local ProfileActionScriptOutputFactory = java_lazy("org.allbinary.input.automation.module.actions.script.condition.processors.output.ProfileActionScriptOutputFactory")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local NodeList = java_lazy("org.w3c.dom.NodeList")
local ProfileActionScriptConditionInterface = require("org.allbinary.input.automation.actions.script.condition.ProfileActionScriptConditionInterface")
local AlwaysActionScriptCondition = java_lazy("org.allbinary.input.automation.actions.script.condition.AlwaysActionScriptCondition")
local ColorAtActionScriptCondition = java_lazy("org.allbinary.input.automation.actions.script.condition.ColorAtActionScriptCondition")
local GenericProfileActionScriptConditionData = java_lazy("org.allbinary.input.automation.actions.script.condition.GenericProfileActionScriptConditionData")
local ProfileActionScriptConditionFactory = java_lazy("org.allbinary.input.automation.actions.script.condition.ProfileActionScriptConditionFactory")
local TimeIntervalActionScriptCondition = java_lazy("org.allbinary.input.automation.actions.script.condition.TimeIntervalActionScriptCondition")

local function java_instanceof(object, class)
    class = java_real(class)
    local metatable = getmetatable(object)
    while metatable do
        if metatable == class then return true end
        local parent = getmetatable(metatable)
        metatable = parent and parent.__index
    end
    return false
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

-- class table BasicProfileActionScriptCondition is declared before the requires
BasicProfileActionScriptCondition.__index = BasicProfileActionScriptCondition
BasicProfileActionScriptCondition.className = "BasicProfileActionScriptCondition"
BasicProfileActionScriptCondition.javaClassName = "org.allbinary.input.automation.actions.script.condition.BasicProfileActionScriptCondition"
setmetatable(BasicProfileActionScriptCondition, {__index = ProfileActionScriptItem})
BasicProfileActionScriptCondition.java_implements = " ProfileActionScriptConditionInterface "
BasicProfileActionScriptCondition.java_interfaces = function() return {ProfileActionScriptConditionInterface} end

function BasicProfileActionScriptCondition:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.profileActionProcessorInterfaceVector == nil then self.profileActionProcessorInterfaceVector = nil end
    if self.profileActionConditionInterfaceVector == nil then self.profileActionConditionInterfaceVector = nil end
end

function BasicProfileActionScriptCondition._jinit(self, ...)
    local count = select("#", ...)
    if count == 2 then return BasicProfileActionScriptCondition._new2(self, ...)
    elseif count == 1 then return BasicProfileActionScriptCondition._new1(self, ...)
    end
    error("No constructor of BasicProfileActionScriptCondition takes " .. count .. " arguments")
end

function BasicProfileActionScriptCondition.new(...)
    local self = setmetatable({}, BasicProfileActionScriptCondition)
    BasicProfileActionScriptCondition._jinit(self, ...)
    return self
end


function BasicProfileActionScriptCondition._new2(self, label, node)
    java_super_init(ProfileActionScriptItem, self, label, node)
    BasicProfileActionScriptCondition._init_fields(self)
        -- super(...) made self above
        self:init()
        local nodeList = node:getChildNodes()
        for index = 0, nodeList:getLength() - 1 do
            local actionItemNode = nodeList:item(index)
            if rawequal(actionItemNode:getNodeType(), Node.ELEMENT_NODE) then
                if rawequal(actionItemNode:getNodeName():compareTo(GenericProfileActionScriptConditionData.NAME), 0) then
                    self:addCondition(ProfileActionScriptConditionFactory.getInstance(actionItemNode))
                elseif rawequal(actionItemNode:getNodeName():compareTo(GenericProfileActionScriptInputData.NAME), 0) then
                    self:addProcessor(ProfileActionScriptInputFactory.getInstance(actionItemNode))
                elseif rawequal(actionItemNode:getNodeName():compareTo(GenericProfileActionScriptOutputData.NAME), 0) then
                    self:addProcessor(ProfileActionScriptOutputFactory.getInstance(actionItemNode))
                end
            end
        end
    return self
end


-- throws Exception
function BasicProfileActionScriptCondition:addProcessorNodes(node)
        local nodeList = node:getChildNodes()
        for index = 0, nodeList:getLength() - 1 do
            local processorActionItemNode = nodeList:item(index)
            if rawequal(processorActionItemNode:getNodeName():compareTo(GenericProfileActionScriptInputData.NAME), 0) then
                self:addProcessor(ProfileActionScriptInputFactory.getInstance(processorActionItemNode))
            elseif rawequal(processorActionItemNode:getNodeName():compareTo(GenericProfileActionScriptOutputData.NAME), 0) then
                self:addProcessor(ProfileActionScriptOutputFactory.getInstance(processorActionItemNode))
            end
        end
end
java_overload(BasicProfileActionScriptCondition, "addProcessorNodes", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Node")) end)


function BasicProfileActionScriptCondition._new1(self, label)
    java_super_init(ProfileActionScriptItem, self, label)
    BasicProfileActionScriptCondition._init_fields(self)
        -- super(...) made self above
        self:init()
    return self
end


function BasicProfileActionScriptCondition:init()
        self:setProfileActionProcessorInterfaceVector(BasicArrayListD.new())
        self:setProfileActionConditionInterfaceVector(BasicArrayListD.new())
        self:getJPopupMenu():add(self:getConditionJPopupMenu())
        self:getJPopupMenu():add(self:getInputJPopupMenu())
        self:getJPopupMenu():add(self:getOutputJPopupMenu())
end
java_overload(BasicProfileActionScriptCondition, "init", 0)


function BasicProfileActionScriptCondition:getConditionJPopupMenu()
        local jMenu = JMenu.new(self.NEW_CONDITION)
        local jMenuItemColorAt = JMenuItem.new(self.NEW_COLOR_AT)
        local jMenuItemAlways = JMenuItem.new(self.NEW_ALWAYS)
        local jMenuItemTimeInterval = JMenuItem.new(self.NEW_TIME_INTERVAL)
        jMenuItemColorAt:addActionListener(self)
        jMenuItemAlways:addActionListener(self)
        jMenuItemTimeInterval:addActionListener(self)
        jMenu:add(jMenuItemColorAt)
        jMenu:add(jMenuItemAlways)
        jMenu:add(jMenuItemTimeInterval)
        return jMenu
end
java_overload(BasicProfileActionScriptCondition, "getConditionJPopupMenu", 0)


function BasicProfileActionScriptCondition:getInputJPopupMenu()
        local jMenu = JMenu.new(self.NEW_INPUT)
        local jMenuItemKey = JMenuItem.new(self.NEW_KEY_INPUT)
        local jMenuItemMouse = JMenuItem.new(self.NEW_MOUSE_INPUT)
        local jMenuItemJoystick = JMenuItem.new(self.NEW_JOYSTICK_INPUT)
        jMenuItemKey:addActionListener(self)
        jMenuItemMouse:addActionListener(self)
        jMenuItemJoystick:addActionListener(self)
        jMenu:add(jMenuItemKey)
        jMenu:add(jMenuItemMouse)
        jMenu:add(jMenuItemJoystick)
        return jMenu
end
java_overload(BasicProfileActionScriptCondition, "getInputJPopupMenu", 0)


function BasicProfileActionScriptCondition:getOutputJPopupMenu()
        local jMenu = JMenu.new(self.NEW_OUTPUT)
        local jMenuItemImage = JMenuItem.new(self.NEW_IMAGE_OUTPUT)
        jMenuItemImage:addActionListener(self)
        jMenu:add(jMenuItemImage)
        return jMenu
end
java_overload(BasicProfileActionScriptCondition, "getOutputJPopupMenu", 0)


function BasicProfileActionScriptCondition:addProcessor(profileActionProcessorInterface)
        self.logUtil:putF(self.commonStrings.START, self, "addInput")
        self:getProfileActionProcessorInterfaceVector():add(profileActionProcessorInterface)
        self:add(profileActionProcessorInterface)
end
java_overload(BasicProfileActionScriptCondition, "addProcessor", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ProfileActionScriptProcessorInterface")) end)


function BasicProfileActionScriptCondition:removeProcessor(profileActionProcessorInterface)
        self.logUtil:putF(self.commonStrings.START, self, "removeInput")
        self:getProfileActionProcessorInterfaceVector():remove(profileActionProcessorInterface)
        self:remove(profileActionProcessorInterface)
end
java_overload(BasicProfileActionScriptCondition, "removeProcessor", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ProfileActionScriptProcessorInterface")) end)


function BasicProfileActionScriptCondition:removeCondition(profileActionScriptNodeInterface)
        self.logUtil:putF(self.commonStrings.START, self, "removeCondition")
        self:getProfileActionConditionInterfaceVector():remove(profileActionScriptNodeInterface)
        self:remove(profileActionScriptNodeInterface)
end
java_overload(BasicProfileActionScriptCondition, "removeCondition", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ProfileActionScriptNodeInterface")) end)


function BasicProfileActionScriptCondition:addCondition(profileActionScriptNodeInterface)
        self.logUtil:putF(self.commonStrings.START, self, "addCondition")
        self:getProfileActionConditionInterfaceVector():add(profileActionScriptNodeInterface)
        self:add(profileActionScriptNodeInterface)
end
java_overload(BasicProfileActionScriptCondition, "addCondition", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ProfileActionScriptNodeInterface")) end)


-- throws Exception
function BasicProfileActionScriptCondition:toXmlNode(document)
        local node = document:createElement(GenericProfileActionScriptConditionData.NAME)
        local profileActionConditionInterfaceVector = self:getProfileActionConditionInterfaceVector()
        local size = profileActionConditionInterfaceVector:size()
        for index = 0, size - 1 do
            local profileActionConditionInterface = profileActionConditionInterfaceVector:get(index)
            node:appendChild(profileActionConditionInterface:toXmlNode(document))
        end
        local profileActionProcessorInterfaceVector = self:getProfileActionProcessorInterfaceVector()
        local size2 = profileActionProcessorInterfaceVector:size()
        for index = 0, size2 - 1 do
            local profileActionProcessorInterface = profileActionProcessorInterfaceVector:get(index)
            node:appendChild(profileActionProcessorInterface:toXmlNode(document))
        end
        return node
end
java_overload(BasicProfileActionScriptCondition, "toXmlNode", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Document")) end)


function BasicProfileActionScriptCondition:getProfileActionConditionInterfaceVector()
        return self.profileActionConditionInterfaceVector
end
java_overload(BasicProfileActionScriptCondition, "getProfileActionConditionInterfaceVector", 0)


function BasicProfileActionScriptCondition:setProfileActionConditionInterfaceVector(profileActionConditionInterfaceVector)
        self.profileActionConditionInterfaceVector = profileActionConditionInterfaceVector
end
java_overload(BasicProfileActionScriptCondition, "setProfileActionConditionInterfaceVector", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "BasicArrayList")) end)


function BasicProfileActionScriptCondition:actionPerformed(actionEvent)
        local try_ok, try_error, try_value = pcall(function()
            java_super(ProfileActionScriptItem, "actionPerformed", 1)(self, actionEvent)
            if rawequal(actionEvent:getActionCommand():compareTo(self.DELETE), 0) then
                if java_instanceof(self:getParent(), ProfileActionScriptNodeInterface) then
                    local profileActionScriptNodeInterface = self:getParent()
                    profileActionScriptNodeInterface:removeCondition(self)
                    JTreeInterfaceFactory.getInstance():getJTreeInterface():updateJTree()
                end
            elseif rawequal(actionEvent:getActionCommand():compareTo(self.NEW_COLOR_AT), 0) then
                self:addCondition(ColorAtActionScriptCondition.new())
                self:updateTree()
            elseif rawequal(actionEvent:getActionCommand():compareTo(self.NEW_ALWAYS), 0) then
                self:addCondition(AlwaysActionScriptCondition.new())
                self:updateTree()
            elseif rawequal(actionEvent:getActionCommand():compareTo(self.NEW_TIME_INTERVAL), 0) then
                self:addCondition(TimeIntervalActionScriptCondition.new())
                self:updateTree()
            elseif rawequal(actionEvent:getActionCommand():compareTo(self.NEW_KEY_INPUT), 0) then
                self:addProcessor(KeyboardActionScriptInput.new())
                self:updateTree()
            elseif rawequal(actionEvent:getActionCommand():compareTo(self.NEW_MOUSE_INPUT), 0) then
                self:addProcessor(MouseActionScriptInput.new())
                self:updateTree()
            elseif rawequal(actionEvent:getActionCommand():compareTo(self.NEW_IMAGE_OUTPUT), 0) then
                self:addProcessor(ImageActionScriptOutput.new())
                self:updateTree()
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put("Error", self, "actionPerformed", e)
        end
end
java_overload(BasicProfileActionScriptCondition, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function BasicProfileActionScriptCondition:getProfileActionProcessorInterfaceVector()
        return self.profileActionProcessorInterfaceVector
end
java_overload(BasicProfileActionScriptCondition, "getProfileActionProcessorInterfaceVector", 0)


function BasicProfileActionScriptCondition:setProfileActionProcessorInterfaceVector(profileActionProcessorInterfaceVector)
        self.profileActionProcessorInterfaceVector = profileActionProcessorInterfaceVector
end
java_overload(BasicProfileActionScriptCondition, "setProfileActionProcessorInterfaceVector", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "BasicArrayList")) end)


function BasicProfileActionScriptCondition:updateTree()
        JTreeInterfaceFactory.getInstance():getJTreeInterface():updateJTree()
        local treePath = TreePath.new(self)
        JTreeInterfaceFactory.getInstance():getJTreeInterface():getActionScriptJTree():expandPath(treePath)
end
java_overload(BasicProfileActionScriptCondition, "updateTree", 0)


-- throws Exception
function BasicProfileActionScriptCondition:shouldProcess(frame)
        local profileActionConditionInterfaceVector = self:getProfileActionConditionInterfaceVector()
        local size = profileActionConditionInterfaceVector:size()
        for index = 0, size - 1 do
            local profileActionScriptConditionInterface = profileActionConditionInterfaceVector:get(index)
            if not (profileActionScriptConditionInterface:shouldProcess(frame)) then
                return false
            end
        end
        return true
end
java_overload(BasicProfileActionScriptCondition, "shouldProcess", 1, function(java_a1) return true and (java_a1 == nil or math.type(java_a1) == "integer") end)


-- throws Exception
function BasicProfileActionScriptCondition:process(frame)
        self.logUtil:putF(tostring(StringMaker.new():append("Start - Processing "):appendint(self:getProfileActionProcessorInterfaceVector():size()):append(" inputs")), self, self.commonStrings.PROCESS)
        local profileActionProcessorInterfaceVector = self:getProfileActionProcessorInterfaceVector()
        local size = profileActionProcessorInterfaceVector:size()
        for index = 0, size - 1 do
            local profileActionScriptProcessorInterface = profileActionProcessorInterfaceVector:get(index)
            profileActionScriptProcessorInterface:process(frame)
        end
end
java_overload(BasicProfileActionScriptCondition, "process", 1, function(java_a1) return true and (java_a1 == nil or math.type(java_a1) == "integer") end)

return BasicProfileActionScriptCondition

