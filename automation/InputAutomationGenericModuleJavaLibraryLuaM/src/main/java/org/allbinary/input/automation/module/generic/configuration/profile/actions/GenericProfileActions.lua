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

local GenericProfileActions = {}
package.loaded["org.allbinary.input.automation.module.generic.configuration.profile.actions.GenericProfileActions"] = GenericProfileActions

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

local DataOutputStream = java_lazy("java.io.DataOutputStream")
local File = java_lazy("java.io.File")
local FileInputStream = java_lazy("java.io.FileInputStream")
local FileOutputStream = java_lazy("java.io.FileOutputStream")
local HashMap = java_lazy("java.util.HashMap")
-- local Set = require("java.util.Set")
local DomNodeInterface = java_lazy("org.allbinary.data.tree.dom.DomNodeInterface")
local DomDocumentHelper = java_lazy("org.allbinary.data.tree.dom.document.DomDocumentHelper")
local XmlDocumentHelper = java_lazy("org.allbinary.data.tree.dom.document.XmlDocumentHelper")
local DomDocumentMappingInterface = java_lazy("org.allbinary.data.tree.dom.document.mapping.DomDocumentMappingInterface")
local DefaultListModelHelper = java_lazy("org.allbinary.input.automation.module.DefaultListModelHelper")
local GenericProfiles = java_lazy("org.allbinary.input.automation.module.generic.configuration.profile.GenericProfiles")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonDataFileStrings = java_lazy("org.allbinary.logic.io.file.CommonDataFileStrings")
local AbPath = java_lazy("org.allbinary.logic.io.path.AbPath")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local NodeList = java_lazy("org.w3c.dom.NodeList")
local GenericProfileAction = java_lazy("org.allbinary.input.automation.module.generic.configuration.profile.actions.GenericProfileAction")
local GenericProfileActionData = java_lazy("org.allbinary.input.automation.module.generic.configuration.profile.actions.GenericProfileActionData")
local GenericProfileActionsData = java_lazy("org.allbinary.input.automation.module.generic.configuration.profile.actions.GenericProfileActionsData")
local GenericProfileActionsJPanel = java_lazy("org.allbinary.input.automation.module.generic.configuration.profile.actions.GenericProfileActionsJPanel")

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

-- class table GenericProfileActions is declared before the requires
GenericProfileActions.__index = GenericProfileActions
GenericProfileActions.className = "GenericProfileActions"
GenericProfileActions.javaClassName = "org.allbinary.input.automation.module.generic.configuration.profile.actions.GenericProfileActions"
GenericProfileActions.java_implements = " DomNodeInterface DomDocumentMappingInterface "
GenericProfileActions.java_interfaces = function() return {DomNodeInterface, DomDocumentMappingInterface} end

function GenericProfileActions:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonFileStrings = CommonDataFileStrings.getInstance()
    if self.name_f == nil then self.name_f = nil end
    if self.genericProfileActionsJPanel == nil then self.genericProfileActionsJPanel = nil end
    if self.actionsDefaultListModelHelper == nil then self.actionsDefaultListModelHelper = nil end
    if self.hashMap == nil then self.hashMap = nil end
end

function GenericProfileActions._jinit(self, ...)
    local count = select("#", ...)
    if count == 2 then return GenericProfileActions._new2(self, ...)
    elseif count == 3 then return GenericProfileActions._new3(self, ...)
    end
    error("No constructor of GenericProfileActions takes " .. count .. " arguments")
end

function GenericProfileActions.new(...)
    local self = setmetatable({}, GenericProfileActions)
    GenericProfileActions._jinit(self, ...)
    return self
end

function GenericProfileActions._new3(self, ...)
    local java_a1, java_a2, java_a3 = ...
    if true and (java_a1 == nil or java_is(java_a1, "GenericProfileActionsJPanel")) and (java_a2 == nil or java_is(java_a2, "AbPath")) and (java_a3 == nil or type(java_a3) == "string") then return GenericProfileActions._new3_1(self, ...) end
    return GenericProfileActions._new3_2(self, ...)
end


function GenericProfileActions._new2(self, genericProfileActionsJPanel, name)
    GenericProfileActions._init_fields(self)
        self:setName(name)
        self:init(genericProfileActionsJPanel)
        self:load()
    return self
end


function GenericProfileActions._new3_1(self, genericProfileActionsJPanel, abPath, name)
    GenericProfileActions._init_fields(self)
        self:setName(name)
        self:init(genericProfileActionsJPanel)
        self:load()
    return self
end


function GenericProfileActions._new3_2(self, genericProfileActionsJPanel, fileInputStream, name)
    GenericProfileActions._init_fields(self)
        self:setName(name)
        self:init(genericProfileActionsJPanel)
        self:fileInit(fileInputStream)
    return self
end


-- throws Exception
function GenericProfileActions:init(genericProfileActionsJPanel)
        self:setGenericProfileActionsJPanel(genericProfileActionsJPanel)
        self.actionsDefaultListModelHelper = DefaultListModelHelper.new()
        self:setHashMap(HashMap.new())
end


-- throws Exception
function GenericProfileActions:save()
        local idFile = FileOutputStream.new(require("allbinary_java").to_string(require("allbinary_java").to_string(GenericProfileActions.DEFAULT_PROFILE_ACTIONS_PATH) .. require("allbinary_java").to_string(self:getName())) .. require("allbinary_java").to_string(self.commonFileStrings._XML))
        local idOutData = DataOutputStream.new(idFile)
        idOutData:writeBytes(XmlDocumentHelper.toString(self:toXmlDoc()))
end


function GenericProfileActions:getFile(name)
        local fileName = require("allbinary_java").to_string(require("allbinary_java").to_string(GenericProfileActions.DEFAULT_PROFILE_ACTIONS_PATH) .. require("allbinary_java").to_string(name)) .. require("allbinary_java").to_string(self.commonFileStrings._XML)
        return File.new(fileName)
end


-- throws Exception
function GenericProfileActions:load()
        local file = self:getFile(self:getName())
        if file:isFile() then
            local idFile = FileInputStream.new(file)
            self:fileInit(idFile)
        else
            self.logUtil:putF(require("allbinary_java").to_string("No Profile: ") .. require("allbinary_java").to_string(file:getAbsolutePath()), self, "Contructor")
        end
end


-- throws Exception
function GenericProfileActions:fileInit(fileInputStream)
        local bytes = java_typed_array("B", java_new_array(0, 100000))
        local length = fileInputStream:read(bytes)
        local data = string.char(table.unpack(bytes))
        local endIndex = data:lastIndexOf(">")
        local document = DomDocumentHelper.create(string.sub(data, (0) + 1, endIndex + 1))
        local nameNodeList = document:getElementsByTagName(GenericProfileActionsData.NAME)
        self.logUtil:putF(require("allbinary_java").to_string("Number Of Profiles Specified: ") .. require("allbinary_java").to_string(nameNodeList:getLength()), self, "Contructor")
        for index = 0, nameNodeList:getLength() - 1 do
            local node = nameNodeList:item(index)
            local nodeList = node:getChildNodes()
            if not rawequal(nodeList, nil) then
                self:initActions(nodeList)
            else
                error(require("java.lang.Exception").new(require("allbinary_java").to_string(GenericProfileActionData.NAME) .. require("allbinary_java").to_string(" Name Node Node Children")), 0)
            end
        end
        self.logUtil:putF(require("allbinary_java").to_string(require("allbinary_java").to_string("Loaded: ") .. require("allbinary_java").to_string(self:getHashMap():size())) .. require("allbinary_java").to_string(" Configuration Profile Action(s)"), self, "Contructor")
        self:getDefaultListModelHelper():initDefaultModelList()
end


-- throws Exception
function GenericProfileActions:initActions(nodeList)
        for index = 0, nodeList:getLength() - 1 do
            local actionNode = nodeList:item(index)
            if not rawequal(actionNode, nil) then
                local genericConfigurationProfileAction = GenericProfileAction.new(self:getGenericProfileActionsJPanel():getGenericProfileActionJPanel(), actionNode)
                self:getHashMap():put(genericConfigurationProfileAction:getName(), genericConfigurationProfileAction)
                self:getDefaultListModelHelper():add(genericConfigurationProfileAction:getName())
            else
                error(require("java.lang.Exception").new(require("allbinary_java").to_string(GenericProfileActionData.NAME) .. require("allbinary_java").to_string(" Node Null")), 0)
            end
        end
end


function GenericProfileActions:getDefaultListModelHelper()
        return self.actionsDefaultListModelHelper
end


function GenericProfileActions:getAction(string_)
        return self:getHashMap():get(string_)
end


-- throws Exception
function GenericProfileActions:add(name)
        local genericProfileAction = GenericProfileAction.new(name)
        self:getHashMap():put(genericProfileAction:getName(), genericProfileAction)
        self:getDefaultListModelHelper():add(genericProfileAction:getName())
        self:getDefaultListModelHelper():initDefaultModelList()
        self:save()
end


-- throws Exception
function GenericProfileActions:remove(name)
        self:getHashMap():remove(name)
        self:getDefaultListModelHelper():remove(name)
        self:getDefaultListModelHelper():initDefaultModelList()
        self:save()
end


function GenericProfileActions:toHashMap()
        local hashMap = StdUtil.getInstance():createHashMap()
        self.logUtil:putF(require("allbinary_java").to_string("HashMap: ") .. require("allbinary_java").to_string(tostring(hashMap)), self, "toHashMap()")
        return hashMap
end


-- throws Exception
function GenericProfileActions:toXmlNode(document)
        local node = document:createElement(GenericProfileActionsData.NAME)
        local set = self:getHashMap():keySet()
        local actionNameArray = set:toArray()
        local size = (actionNameArray.n or #actionNameArray)
        for index = 0, size - 1 do
            local nextActionName = actionNameArray[index + 1]
            local nextGenericProfileAction = self:getAction(nextActionName)
            node:appendChild(nextGenericProfileAction:toXmlNode(document))
        end
        return node
end


-- throws Exception
function GenericProfileActions:toXmlDoc()
        local document = DomDocumentHelper.create()
        local node = self:toXmlNode(document)
        document:appendChild(node)
        return document
end


function GenericProfileActions:getGenericProfileActionsJPanel()
        return self.genericProfileActionsJPanel
end


function GenericProfileActions:setGenericProfileActionsJPanel(genericProfileActionsJPanel)
        self.genericProfileActionsJPanel = genericProfileActionsJPanel
end


function GenericProfileActions:getHashMap()
        return self.hashMap
end


function GenericProfileActions:setHashMap(hashMap)
        self.hashMap = hashMap
end


function GenericProfileActions:getName()
        return self.name_f
end


function GenericProfileActions:setName(name)
        self.name_f = name
end

GenericProfileActions.DEFAULT_PROFILE_ACTIONS_PATH = require("allbinary_java").to_string(GenericProfiles.DEFAULT_PROFILES_PATH) .. require("allbinary_java").to_string("actions/")

return GenericProfileActions

