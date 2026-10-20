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
-- package org.allbinary.input.automation.module.generic.configuration.profile

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
local GenericProfileActionData = require("org.allbinary.input.automation.module.generic.configuration.profile.actions.GenericProfileActionData")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
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

local GenericProfiles = {}
GenericProfiles.__index = GenericProfiles
GenericProfiles.className = "GenericProfiles"

function GenericProfiles:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.hashMap = nil
    self.profilesDefaultListModelHelper = nil
    self.fileName = nil
end


function GenericProfiles.new(fileName)
    local self = setmetatable({}, GenericProfiles)
    self:_init_fields()
        self.fileName = fileName
        self.profilesDefaultListModelHelper = DefaultListModelHelper.new()
        self.hashMap = StdUtil.getInstance():createHashMap()
        if File.new(fileName):isFile() then
            local bytes = java_new_array(0, 100000)
            local idFile = FileInputStream.new(fileName)
            local length = idFile:read(bytes)
            local data = string.char(table.unpack(bytes))
            local endIndex = data:lastIndexOf(">")
            local document = DomDocumentHelper.create(string.sub(data, (0) + 1, endIndex + 1))
            local nodeList = document:getElementsByTagName(GenericProfilesData.NAME)
            self.logUtil:putF("Number Of Profiles Specified: " .. tostring(nodeList:getLength()), self, "Contructor")
            if nodeList ~= nil then
                self:initProfiles(nodeList:item(0))
            else
                error(java_exception("Exception", tostring(GenericProfileActionData.NAME) .. " Name Node Node Children"), 0)
            end
            self.logUtil:putF("Loaded: " .. tostring(self.hashMap:size()) .. " Configuration Profile Actions", self, "Contructor")
        else
            self.logUtil:putF("No Generic Profile: " .. fileName, self, "Contructor")
        end
        self:getDefaultListModelHelper():initDefaultModelList()
    return self
end


-- throws Exception
function GenericProfiles:initProfiles(node)
        local nodeList = node:getChildNodes()
        for index = 0, nodeList:getLength() - 1 do
            local profileNameNode = nodeList:item(index)
            if profileNameNode:getNodeName():compareTo(GenericProfileData.NAME) == 0 then
                local genericProfile = GenericProfile.new(profileNameNode)
                self.hashMap:put(genericProfile:getName(), genericProfile)
                self:getDefaultListModelHelper():add(genericProfile:getName())
            end
        end
end


function GenericProfiles:getDefaultListModelHelper()
        return self.profilesDefaultListModelHelper
end


-- throws Exception
function GenericProfiles:get(name)
        local genericProfile = self.hashMap:get(name)
        if genericProfile == nil then
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:putF("No Generic Profile Named: " .. name .. " availability was: " .. tostring(self.hashMap), self, commonStrings.GET)
        end
        return genericProfile
end


-- throws Exception
function GenericProfiles:add(name)
        self.hashMap:put(name, GenericProfile.new(name))
        self:getDefaultListModelHelper():add(name)
        self:getDefaultListModelHelper():initDefaultModelList()
        self:save()
end


-- throws Exception
function GenericProfiles:remove(name)
        self.hashMap:remove(name)
        self:getDefaultListModelHelper():remove(name)
        self:getDefaultListModelHelper():initDefaultModelList()
        self:save()
end


-- throws Exception
function GenericProfiles:toXmlNode(document)
        local node = document:createElement(GenericProfilesData.NAME)
        local set = self.hashMap:keySet()
        local nameArray = set:toArray()
        local size = (nameArray.n or #nameArray)
        for index = 0, size - 1 do
            local genericProfile = self.hashMap:get(nameArray[index + 1])
            node:appendChild(genericProfile:toXmlNode(document))
        end
        return node
end


-- throws Exception
function GenericProfiles:toXmlDoc()
        local document = DomDocumentHelper.create()
        local node = self:toXmlNode(document)
        document:appendChild(node)
        return document
end


-- throws Exception
function GenericProfiles:save()
        local idFile = FileOutputStream.new(self.fileName)
        local idOutData = DataOutputStream.new(idFile)
        local documentString = XmlDocumentHelper.toString(self:toXmlDoc())
        idOutData:writeBytes(documentString)
end

GenericProfiles.DEFAULT_PROFILES_PATH = "./modules/configs/profiles/"
GenericProfiles.DEFAULT_PROFILE_ACTIONS_PATH = tostring(GenericProfiles.DEFAULT_PROFILES_PATH) .. "actions/"
GenericProfiles.DEFAULT_FILE = tostring(GenericProfiles.DEFAULT_PROFILES_PATH) .. "profiles.xml"

return GenericProfiles

