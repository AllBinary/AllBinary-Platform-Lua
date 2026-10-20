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

-- local DataOutputStream = require("java.io.DataOutputStream")
-- local File = require("java.io.File")
-- local FileInputStream = require("java.io.FileInputStream")
-- local FileOutputStream = require("java.io.FileOutputStream")
-- local HashMap = require("java.util.HashMap")
-- local Set = require("java.util.Set")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local DomDocumentHelper = require("org.allbinary.data.tree.dom.document.DomDocumentHelper")
local XmlDocumentHelper = require("org.allbinary.data.tree.dom.document.XmlDocumentHelper")
local DomDocumentMappingInterface = require("org.allbinary.data.tree.dom.document.mapping.DomDocumentMappingInterface")
local DefaultListModelHelper = require("org.allbinary.input.automation.module.DefaultListModelHelper")
local GenericProfiles = require("org.allbinary.input.automation.module.generic.configuration.profile.GenericProfiles")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonDataFileStrings = require("org.allbinary.logic.io.file.CommonDataFileStrings")
local AbPath = require("org.allbinary.logic.io.path.AbPath")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local NodeList = require("org.w3c.dom.NodeList")

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

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GenericProfileActions = {}
GenericProfileActions.__index = GenericProfileActions
GenericProfileActions.className = "GenericProfileActions"

function GenericProfileActions:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonFileStrings = CommonDataFileStrings.getInstance()
    self.name = nil
    self.genericProfileActionsJPanel = nil
    self.actionsDefaultListModelHelper = nil
    self.hashMap = nil
end

function GenericProfileActions.new(...)
    local count = select("#", ...)
    if count == 2 then return GenericProfileActions._new2(...)
    elseif count == 3 then return GenericProfileActions._new3(...)
    elseif count == 3 then return GenericProfileActions._new3(...)
    end
end


function GenericProfileActions._new2(genericProfileActionsJPanel, name)
    local self = setmetatable({}, GenericProfileActions)
    self:_init_fields()
        self:setName(name)
        self:init(genericProfileActionsJPanel)
        self:load()
    return self
end


function GenericProfileActions._new3(genericProfileActionsJPanel, abPath, name)
    local self = setmetatable({}, GenericProfileActions)
    self:_init_fields()
        self:setName(name)
        self:init(genericProfileActionsJPanel)
        self:load()
    return self
end


function GenericProfileActions._new3(genericProfileActionsJPanel, fileInputStream, name)
    local self = setmetatable({}, GenericProfileActions)
    self:_init_fields()
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
        local idFile = FileOutputStream.new(tostring(GenericProfileActions.DEFAULT_PROFILE_ACTIONS_PATH) .. self:getName() .. tostring(self.commonFileStrings._XML))
        local idOutData = DataOutputStream.new(idFile)
        idOutData:writeBytes(XmlDocumentHelper.toString(self:toXmlDoc()))
end


function GenericProfileActions:getFile(name)
        local fileName = GenericProfileActions.DEFAULT_PROFILE_ACTIONS_PATH .. name .. tostring(self.commonFileStrings._XML)
        return File.new(fileName)
end


-- throws Exception
function GenericProfileActions:load()
        local file = self:getFile(self:getName())
        if file:isFile() then
            local idFile = FileInputStream.new(file)
            self:fileInit(idFile)
        else
            self.logUtil:putF("No Profile: " .. tostring(file:getAbsolutePath()), self, "Contructor")
        end
end


-- throws Exception
function GenericProfileActions:fileInit(fileInputStream)
        local bytes = java_new_array(0, 100000)
        local length = fileInputStream:read(bytes)
        local data = string.char(table.unpack(bytes))
        local endIndex = data:lastIndexOf(">")
        local document = DomDocumentHelper.create(string.sub(data, (0) + 1, endIndex + 1))
        local nameNodeList = document:getElementsByTagName(GenericProfileActionsData.NAME)
        self.logUtil:putF("Number Of Profiles Specified: " .. tostring(nameNodeList:getLength()), self, "Contructor")
        for index = 0, nameNodeList:getLength() - 1 do
            local node = nameNodeList:item(index)
            local nodeList = node:getChildNodes()
            if nodeList ~= nil then
                self:initActions(nodeList)
            else
                error(java_exception("Exception", tostring(GenericProfileActionData.NAME) .. " Name Node Node Children"), 0)
            end
        end
        self.logUtil:putF("Loaded: " .. tostring(self:getHashMap():size()) .. " Configuration Profile Action(s)", self, "Contructor")
        self:getDefaultListModelHelper():initDefaultModelList()
end


-- throws Exception
function GenericProfileActions:initActions(nodeList)
        for index = 0, nodeList:getLength() - 1 do
            local actionNode = nodeList:item(index)
            if actionNode ~= nil then
                local genericConfigurationProfileAction = GenericProfileAction.new(self:getGenericProfileActionsJPanel():getGenericProfileActionJPanel(), actionNode)
                self:getHashMap():put(genericConfigurationProfileAction:getName(), genericConfigurationProfileAction)
                self:getDefaultListModelHelper():add(genericConfigurationProfileAction:getName())
            else
                error(java_exception("Exception", tostring(GenericProfileActionData.NAME) .. " Node Null"), 0)
            end
        end
end


function GenericProfileActions:getDefaultListModelHelper()
        return self.actionsDefaultListModelHelper
end


function GenericProfileActions:getAction(string)
        return self:getHashMap():get(string)
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
        self.logUtil:putF("HashMap: " .. tostring(hashMap), self, "toHashMap()")
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
        return self.name
end


function GenericProfileActions:setName(name)
        self.name = name
end

GenericProfileActions.DEFAULT_PROFILE_ACTIONS_PATH = tostring(GenericProfiles.DEFAULT_PROFILES_PATH) .. "actions/"

return GenericProfileActions

