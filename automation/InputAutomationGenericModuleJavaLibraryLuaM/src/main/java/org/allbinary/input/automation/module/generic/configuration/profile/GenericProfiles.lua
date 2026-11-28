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

local GenericProfiles = {}
package.loaded["org.allbinary.input.automation.module.generic.configuration.profile.GenericProfiles"] = GenericProfiles

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
local GenericProfileActionData = java_lazy("org.allbinary.input.automation.module.generic.configuration.profile.actions.GenericProfileActionData")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local NodeList = java_lazy("org.w3c.dom.NodeList")
local GenericProfile = java_lazy("org.allbinary.input.automation.module.generic.configuration.profile.GenericProfile")
local GenericProfileData = java_lazy("org.allbinary.input.automation.module.generic.configuration.profile.GenericProfileData")
local GenericProfilesData = java_lazy("org.allbinary.input.automation.module.generic.configuration.profile.GenericProfilesData")

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

-- class table GenericProfiles is declared before the requires
GenericProfiles.__index = GenericProfiles
GenericProfiles.className = "GenericProfiles"
GenericProfiles.javaClassName = "org.allbinary.input.automation.module.generic.configuration.profile.GenericProfiles"
GenericProfiles.java_implements = " DomNodeInterface DomDocumentMappingInterface "
GenericProfiles.java_interfaces = function() return {DomNodeInterface, DomDocumentMappingInterface} end

function GenericProfiles:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.hashMap == nil then self.hashMap = nil end
    if self.profilesDefaultListModelHelper == nil then self.profilesDefaultListModelHelper = nil end
    if self.fileName == nil then self.fileName = nil end
end


function GenericProfiles._jinit(self, fileName)
    GenericProfiles._init_fields(self)
        self.fileName = fileName
        self.profilesDefaultListModelHelper = DefaultListModelHelper.new()
        self.hashMap = StdUtil.getInstance():createHashMap()
        if File.new(fileName):isFile() then
            local bytes = java_typed_array("B", java_new_array(0, 100000))
            local idFile = FileInputStream.new(fileName)
            local length = idFile:read(bytes)
            local data = string.char(table.unpack(bytes))
            local endIndex = data:lastIndexOf(">")
            local document = DomDocumentHelper.create(string.sub(data, (0) + 1, endIndex + 1))
            local nodeList = document:getElementsByTagName(GenericProfilesData.NAME)
            self.logUtil:putF(require("allbinary_java").to_string("Number Of Profiles Specified: ") .. require("allbinary_java").to_string(nodeList:getLength()), self, "Contructor")
            if not rawequal(nodeList, nil) then
                self:initProfiles(nodeList:item(0))
            else
                error(require("java.lang.Exception").new(require("allbinary_java").to_string(GenericProfileActionData.NAME) .. require("allbinary_java").to_string(" Name Node Node Children")), 0)
            end
            self.logUtil:putF(require("allbinary_java").to_string(require("allbinary_java").to_string("Loaded: ") .. require("allbinary_java").to_string(self.hashMap:size())) .. require("allbinary_java").to_string(" Configuration Profile Actions"), self, "Contructor")
        else
            self.logUtil:putF(require("allbinary_java").to_string("No Generic Profile: ") .. require("allbinary_java").to_string(fileName), self, "Contructor")
        end
        self:getDefaultListModelHelper():initDefaultModelList()
    return self
end

function GenericProfiles.new(...)
    local self = setmetatable({}, GenericProfiles)
    GenericProfiles._jinit(self, ...)
    return self
end


-- throws Exception
function GenericProfiles:initProfiles(node)
        local nodeList = node:getChildNodes()
        for index = 0, nodeList:getLength() - 1 do
            local profileNameNode = nodeList:item(index)
            if rawequal(profileNameNode:getNodeName():compareTo(GenericProfileData.NAME), 0) then
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
        if rawequal(genericProfile, nil) then
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:putF(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string("No Generic Profile Named: ") .. require("allbinary_java").to_string(name)) .. require("allbinary_java").to_string(" availability was: ")) .. require("allbinary_java").to_string(self.hashMap), self, commonStrings.GET)
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
GenericProfiles.DEFAULT_PROFILE_ACTIONS_PATH = require("allbinary_java").to_string(GenericProfiles.DEFAULT_PROFILES_PATH) .. require("allbinary_java").to_string("actions/")
GenericProfiles.DEFAULT_FILE = require("allbinary_java").to_string(GenericProfiles.DEFAULT_PROFILES_PATH) .. require("allbinary_java").to_string("profiles.xml")

return GenericProfiles

