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

local GenericProfile = {}
package.loaded["org.allbinary.input.automation.module.generic.configuration.profile.GenericProfile"] = GenericProfile

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

local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local DomNodeHelper = java_lazy("org.allbinary.data.tree.dom.DomNodeHelper")
local ModDomHelper = java_lazy("org.allbinary.data.tree.dom.ModDomHelper")
local GenericProfileActions = java_lazy("org.allbinary.input.automation.module.generic.configuration.profile.actions.GenericProfileActions")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local NodeList = java_lazy("org.w3c.dom.NodeList")
local GenericProfileData = java_lazy("org.allbinary.input.automation.module.generic.configuration.profile.GenericProfileData")
local GenericProfileDataWorkerData = java_lazy("org.allbinary.input.automation.module.generic.configuration.profile.GenericProfileDataWorkerData")
local GenericProfileDataWorkerType = java_lazy("org.allbinary.input.automation.module.generic.configuration.profile.GenericProfileDataWorkerType")

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

local function java_class_matches(class, name)
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
local java_type_matches = setmetatable({}, {__mode = "k"})
local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    if type(class) ~= "table" then return false end
    local matches = java_type_matches[class]
    if matches and matches[name] then return true end
    if not java_class_matches(class, name) then return false end
    if not matches then matches = {}; java_type_matches[class] = matches end
    matches[name] = true
    return true
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

-- class table GenericProfile is declared before the requires
GenericProfile.__index = GenericProfile
GenericProfile.className = "GenericProfile"
GenericProfile.javaClassName = "org.allbinary.input.automation.module.generic.configuration.profile.GenericProfile"

function GenericProfile:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.name_f == nil then self.name_f = nil end
    if self.vector == nil then self.vector = nil end
    if self.genericProfileActions == nil then self.genericProfileActions = nil end
end

function GenericProfile._jinit(self, ...)
    local count = select("#", ...)
    if count == 1 then return GenericProfile._new1(self, ...)
    end
    error("No constructor of GenericProfile takes " .. count .. " arguments")
end

function GenericProfile.new(...)
    local self = setmetatable({}, GenericProfile)
    GenericProfile._jinit(self, ...)
    return self
end

function GenericProfile._new1(self, ...)
    local java_a1 = ...
    if true and (java_a1 == nil or java_is(java_a1, "Node")) then return GenericProfile._new1_1(self, ...) end
    return GenericProfile._new1_2(self, ...)
end


function GenericProfile._new1_1(self, node)
    GenericProfile._init_fields(self)
        self:setName(DomNodeHelper.getTextNodeValue(node))
        self.vector = BasicArrayListD.new()
        local nodeList = node:getChildNodes()
        self.logUtil:putF(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string("Name: ") .. require("allbinary_java").to_string(self:getName())) .. require("allbinary_java").to_string(" Child Nodes: ")) .. require("allbinary_java").to_string(nodeList:getLength()), self, "Contructor")
        for index = 0, nodeList:getLength() - 1 do
            local profileNode = nodeList:item(index)
            if rawequal(profileNode:getNodeName():compareTo(GenericProfileDataWorkerData.NAME), 0) then
                local genericProfileDataWorkerType = GenericProfileDataWorkerType.getInstance(profileNode)
                self.logUtil:putF(require("allbinary_java").to_string("Adding GenericProfileDataWorkerType: ") .. require("allbinary_java").to_string(tostring(genericProfileDataWorkerType)), self, "Contructor")
                self.vector:add(genericProfileDataWorkerType)
            end
        end
    return self
end


function GenericProfile._new1_2(self, name)
    GenericProfile._init_fields(self)
        self:setName(name)
        self.vector = BasicArrayListD.new()
    return self
end


function GenericProfile:getGenericProfileDataWorkerTypeVector()
        return self.vector
end


function GenericProfile:add(genericProfileDataWorkerType)
        if not (self.vector:contains(genericProfileDataWorkerType)) then
            self.vector:add(genericProfileDataWorkerType)
        end
end


function GenericProfile:remove(genericProfileDataWorkerType)
        self.vector:remove(genericProfileDataWorkerType)
end


-- throws Exception
function GenericProfile:toXmlNode(document)
        local node = ModDomHelper.createTextNode(document, GenericProfileData.NAME, self.name_f)
        local size = self.vector:size()
        for index = 0, size - 1 do
            local genericProfileDataWorkerType = self.vector:get(index)
            node:appendChild(genericProfileDataWorkerType:toXmlNode(document))
        end
        return node
end


function GenericProfile:getName()
        return self.name_f
end


function GenericProfile:setName(name)
        self.name_f = name
end


function GenericProfile:getGenericProfileActions()
        return self.genericProfileActions
end


function GenericProfile:setGenericProfileActions(genericProfileActions)
        self.genericProfileActions = genericProfileActions
end

return GenericProfile

