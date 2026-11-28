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
-- package org.allbinary.logic.control.workflow.request

local BasicWorkFlow = {}
package.loaded["org.allbinary.logic.control.workflow.request.BasicWorkFlow"] = BasicWorkFlow

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

local Calendar = java_lazy("java.util.Calendar")
local HashMap = java_lazy("java.util.HashMap")
-- local Set = require("java.util.Set")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local StoreFrontData = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontData")
local EntryData = java_lazy("org.allbinary.business.entry.EntryData")
local ModDomHelper = java_lazy("org.allbinary.data.tree.dom.ModDomHelper")
local DomDocumentHelper = java_lazy("org.allbinary.data.tree.dom.document.DomDocumentHelper")
local XmlDocumentHelper = java_lazy("org.allbinary.data.tree.dom.document.XmlDocumentHelper")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local RequestParams = java_lazy("org.allbinary.logic.communication.http.request.RequestParams")
local WeblisketSession = java_lazy("org.allbinary.logic.communication.http.request.session.WeblisketSession")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local WorkFlowData = java_lazy("org.allbinary.logic.control.workflow.WorkFlowData")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")

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

-- class table BasicWorkFlow is declared before the requires
BasicWorkFlow.__index = BasicWorkFlow
BasicWorkFlow.className = "BasicWorkFlow"
BasicWorkFlow.javaClassName = "org.allbinary.logic.control.workflow.request.BasicWorkFlow"

function BasicWorkFlow:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.workFlowDoc == nil then self.workFlowDoc = nil end
    if self.workFlowName == nil then self.workFlowName = nil end
    if self.storeName == nil then self.storeName = nil end
end

function BasicWorkFlow._jinit(self, ...)
    local count = select("#", ...)
    if count == 0 then return BasicWorkFlow._new0(self, ...)
    elseif count == 2 then return BasicWorkFlow._new2(self, ...)
    elseif count == 1 then return BasicWorkFlow._new1(self, ...)
    end
    error("No constructor of BasicWorkFlow takes " .. count .. " arguments")
end

function BasicWorkFlow.new(...)
    local self = setmetatable({}, BasicWorkFlow)
    BasicWorkFlow._jinit(self, ...)
    return self
end


function BasicWorkFlow._new0(self)
    BasicWorkFlow._init_fields(self)
        self.workFlowName = StringUtil.getInstance().EMPTY_STRING
        self.workFlowDoc = DomDocumentHelper.create()
        local workFlowNode = self.workFlowDoc:createElement(WorkFlowData.getInstance().WORKFLOW)
        self.workFlowDoc:appendChild(workFlowNode)
    return self
end


function BasicWorkFlow._new2(self, hashMap, pageContext)
    BasicWorkFlow._init_fields(self)
        local weblisketSession = WeblisketSession.new(hashMap, pageContext)
        self.storeName = weblisketSession:getStoreName()
        local requestHashMap = RequestParams.new(pageContext):toHashMap()
        self.workFlowName = requestHashMap:get(WorkFlowData.getInstance().NAME)
        self.workFlowDoc = DomDocumentHelper.create(requestHashMap:get(WorkFlowData.getInstance().DATA))
    return self
end


function BasicWorkFlow._new1(self, hashMap)
    BasicWorkFlow._init_fields(self)
        self.workFlowName = hashMap:get(WorkFlowData.getInstance().NAME)
        self.storeName = hashMap:get(StoreFrontData.getInstance().NAME)
        self.workFlowDoc = DomDocumentHelper.create(hashMap:get(WorkFlowData.getInstance().DATA))
    return self
end


function BasicWorkFlow:getName()
        return self.workFlowName
end


function BasicWorkFlow:getStoreName()
        return self.storeName
end


function BasicWorkFlow:getKey()
        return self:getName()
end


-- throws Exception
function BasicWorkFlow:toVector()
        local values = BasicArrayListD.new()
        values:add(self.workFlowName)
        values:add(self.storeName)
        values:add(XmlDocumentHelper.toString(self.workFlowDoc))
        local calendar = Calendar.getInstance()
        local time = tostring(tostring(calendar:getTimeInMillis()))
        values:add(time)
        values:add(time)
        return values
end


-- throws Exception
function BasicWorkFlow:toHashMap()
        local hashMap = StdUtil.getInstance():createHashMap()
        hashMap:put(WorkFlowData.getInstance().NAME, self.workFlowName)
        hashMap:put(StoreFrontData.getInstance().NAME, self.storeName)
        hashMap:put(WorkFlowData.getInstance().DATA, XmlDocumentHelper.toString(self.workFlowDoc))
        local calendar = Calendar.getInstance()
        local time = tostring(tostring(calendar:getTimeInMillis()))
        hashMap:put(EntryData.getInstance().LASTMODIFIED, time)
        return hashMap
end


function BasicWorkFlow:toXmlNode(document)
        local try_ok, try_error, try_value = pcall(function()
            local hashMap = self:toHashMap()
            local keySet = hashMap:keySet()
            local node = document:createElement(WorkFlowData.getInstance().WORKFLOW)
            local nameArray = keySet:toArray()
            local size = (nameArray.n or #nameArray)
            for index = 0, size - 1 do
                local name = nameArray[index + 1]
                local value = hashMap:get(name)
                node:appendChild(ModDomHelper.createNameValueNodes(document, name, value))
            end
            do return "__jreturn", node end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "toXmlNode()", e)
            end
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function BasicWorkFlow:toXmlDoc()
        local try_ok, try_error, try_value = pcall(function()
            do return "__jreturn", self.workFlowDoc end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "toXmlDoc()", e)
            end
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function BasicWorkFlow:isValid()
        local try_ok, try_error, try_value = pcall(function()
            local returnBoolean = true
            if rawequal(self.workFlowName, nil) then
                returnBoolean = false
            end
            do return "__jreturn", returnBoolean end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put("Failed to validate", self, self.commonStrings.IS_VALID, e)
            end
            return false
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function BasicWorkFlow:validationInfo()
        local try_ok, try_error, try_value = pcall(function()
            local stringBuffer = StringMaker.new()
            if rawequal(self.workFlowName, nil) then
                stringBuffer:append("No WorkFlow name specified.")
            end
            do return "__jreturn", tostring(stringBuffer) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEWERROR) then
                self.logUtil:put("Failed to generate validation error info", self, "validationInfo()", e)
            end
            return "Error Getting Validation Info"
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function BasicWorkFlow:toValidationInfoDoc()
        return nil
end


function BasicWorkFlow:toValidationInfoNode(document)
        return nil
end

return BasicWorkFlow

