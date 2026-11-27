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
-- package org.allbinary.business.user.address

local StreetAddress = {}
package.loaded["org.allbinary.business.user.address.StreetAddress"] = StreetAddress

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
-- local Set = require("java.util.Set")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
local DomNodeHelper = java_lazy("org.allbinary.data.tree.dom.DomNodeHelper")
local DomSearchHelper = java_lazy("org.allbinary.data.tree.dom.DomSearchHelper")
local ModDomHelper = java_lazy("org.allbinary.data.tree.dom.ModDomHelper")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local StringValidationUtil = java_lazy("org.allbinary.logic.string.StringValidationUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local StreetAddressData = java_lazy("org.allbinary.business.user.address.StreetAddressData")

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

-- class table StreetAddress is declared before the requires
StreetAddress.__index = StreetAddress
StreetAddress.className = "StreetAddress"
StreetAddress.javaClassName = "org.allbinary.business.user.address.StreetAddress"

function StreetAddress:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.id == nil then self.id = nil end
    if self.name_f == nil then self.name_f = nil end
    if self.street == nil then self.street = nil end
    if self.city == nil then self.city = nil end
    if self.state == nil then self.state = nil end
    if self.code == nil then self.code = nil end
    if self.country == nil then self.country = nil end
    self.isDefault_f = false
end

function StreetAddress._jinit(self, ...)
    local count = select("#", ...)
    if count == 0 then return StreetAddress._new0(self, ...)
    elseif count == 1 then return StreetAddress._new1(self, ...)
    elseif count == 6 then return StreetAddress._new6(self, ...)
    end
    error("No constructor of StreetAddress takes " .. count .. " arguments")
end

function StreetAddress.new(...)
    local self = setmetatable({}, StreetAddress)
    StreetAddress._jinit(self, ...)
    return self
end

function StreetAddress._new1(self, ...)
    local java_a1 = ...
    if true and (java_a1 == nil or java_is(java_a1, "Node")) then return StreetAddress._new1_1(self, ...) end
    if true and (java_a1 == nil or java_is(java_a1, "StreetAddress")) then return StreetAddress._new1_2(self, ...) end
    if true and (java_a1 == nil or java_is(java_a1, "HttpServletRequest")) then return StreetAddress._new1_3(self, ...) end
    return StreetAddress._new1_4(self, ...)
end


function StreetAddress._new0(self)
    StreetAddress._init_fields(self)
    return self
end


function StreetAddress._new1_1(self, node)
    StreetAddress._init_fields(self)
        local nameNode = DomSearchHelper.getNode(StreetAddressData.NAME, node:getChildNodes())
        self.name_f = DomNodeHelper.getTextNodeValue(nameNode)
        local streetNode = DomSearchHelper.getNode(StreetAddressData.STREET, node:getChildNodes())
        self.street = DomNodeHelper.getTextNodeValue(streetNode)
        local cityNode = DomSearchHelper.getNode(StreetAddressData.CITY, node:getChildNodes())
        self.city = DomNodeHelper.getTextNodeValue(cityNode)
        local stateNode = DomSearchHelper.getNode(StreetAddressData.STATE, node:getChildNodes())
        self.state = DomNodeHelper.getTextNodeValue(stateNode)
        local codeNode = DomSearchHelper.getNode(StreetAddressData.CODE, node:getChildNodes())
        self.code = DomNodeHelper.getTextNodeValue(codeNode)
        local countryNode = DomSearchHelper.getNode(StreetAddressData.COUNTRY, node:getChildNodes())
        self.country = DomNodeHelper.getTextNodeValue(countryNode)
        self:log()
    return self
end


function StreetAddress._new1_2(self, streetAddress)
    StreetAddress._init_fields(self)
        self.id = streetAddress:getId()
        self.name_f = streetAddress:getName()
        self.street = streetAddress:getStreet()
        self.city = streetAddress:getCity()
        self.state = streetAddress:getState()
        self.code = streetAddress:getCode()
        self.country = streetAddress:getCountry()
        self.isDefault_f = streetAddress:isDefault()
        self:log()
    return self
end


function StreetAddress._new1_3(self, request)
    StreetAddress._init_fields(self)
        self:setId(request:getParameter(StreetAddressData.ID))
        self:setName(request:getParameter(StreetAddressData.NAME))
        self:setStreet(request:getParameter(StreetAddressData.STREET))
        self:setCity(request:getParameter(StreetAddressData.CITY))
        self:setState(request:getParameter(StreetAddressData.STATE))
        self:setCode(request:getParameter(StreetAddressData.CODE))
        self:setCountry(request:getParameter(StreetAddressData.COUNTRY))
        self:log()
    return self
end


function StreetAddress._new6(self, name, street, city, state, code, country)
    StreetAddress._init_fields(self)
        self.name_f = name
        self.street = street
        self.city = city
        self.state = state
        self.code = code
        self.country = country
        self:log()
    return self
end


function StreetAddress._new1_4(self, address)
    StreetAddress._init_fields(self)
        self.id = address:get(StreetAddressData.ID)
        self.name_f = address:get(StreetAddressData.NAME)
        self.street = address:get(StreetAddressData.STREET)
        self.city = address:get(StreetAddressData.CITY)
        self.state = address:get(StreetAddressData.STATE)
        self.code = address:get(StreetAddressData.CODE)
        self.country = address:get(StreetAddressData.COUNTRY)
        local def = address:get(StreetAddressData.DEFAULT)
        if def ~= nil and ((def < StreetAddressData.DEFAULT and -1) or (def > StreetAddressData.DEFAULT and 1) or 0) == 0 then
            self.isDefault_f = true
        else
            self.isDefault_f = false
        end
        self:log()
    return self
end


function StreetAddress:log()
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
            self.logUtil:putF("Created Address: \n" .. tostring(self:toHashMap()), self, "log")
        end
end


function StreetAddress:setId(id)
        self.id = id
end


function StreetAddress:setName(name)
        self.name_f = name
end


function StreetAddress:setStreet(value)
        self.street = value
end


function StreetAddress:setCity(value)
        self.city = value
end


function StreetAddress:setState(value)
        self.state = value
end


function StreetAddress:setCode(value)
        self.code = value
end


function StreetAddress:setCountry(value)
        self.country = value
end


function StreetAddress:getName()
        return self.name_f
end


function StreetAddress:getStreet()
        return self.street
end


function StreetAddress:getCity()
        return self.city
end


function StreetAddress:getState()
        return self.state
end


function StreetAddress:getCode()
        return self.code
end


function StreetAddress:getCountry()
        return self.country
end


function StreetAddress:getId()
        return self.id
end


function StreetAddress:isDefault()
        return self.isDefault_f
end


function StreetAddress:isEmpty()
        local EMPTY_STRING = StringUtil.getInstance().EMPTY_STRING
        if self:getName() == nil and self:getName():compareTo(EMPTY_STRING) == 0 and self:getStreet() == nil and self:getStreet():compareTo(EMPTY_STRING) == 0 and self:getCity() == nil and self:getCity():compareTo(EMPTY_STRING) == 0 and self:getState() == nil and self:getState():compareTo(EMPTY_STRING) == 0 and self:getCode() == nil and self:getCode():compareTo(EMPTY_STRING) == 0 and self:getCountry() == nil and self:getCountry():compareTo(EMPTY_STRING) == 0 then
            return true
        end
        return false
end


function StreetAddress:isValid()
        local EMPTY_STRING = StringUtil.getInstance().EMPTY_STRING
        if self:getName() == nil or self:getName():compareTo(EMPTY_STRING) == 0 or self:getStreet() == nil or self:getStreet():compareTo(EMPTY_STRING) == 0 or self:getCity() == nil or self:getCity():compareTo(EMPTY_STRING) == 0 or self:getState() == nil or self:getState():compareTo(EMPTY_STRING) == 0 or self:getCode() == nil or self:getCode():compareTo(EMPTY_STRING) == 0 or self:getCountry() == nil or self:getCountry():compareTo(EMPTY_STRING) == 0 then
            return false
        end
        return true
end


function StreetAddress:validationInfo()
        local stringBuffer = StringMaker.new()
        stringBuffer:append("Address Failed To Validate - All fields must contain data.<br></br>")
        local stringValidationUtil = StringValidationUtil.getInstance()
        if not stringValidationUtil:isValidRequired(self:getName(), StreetAddressData.MIN, StreetAddressData.MAX) then
            stringBuffer:append("Please enter a valid name")
            stringBuffer:append("<br></br>")
        end
        if not stringValidationUtil:isValidRequired(self:getStreet(), StreetAddressData.MIN, StreetAddressData.MAX) then
            stringBuffer:append("Please enter a valid street")
            stringBuffer:append("<br></br>")
        end
        if not stringValidationUtil:isValidRequired(self:getCity(), StreetAddressData.MIN, StreetAddressData.MAX) then
            stringBuffer:append("Please enter a valid city")
            stringBuffer:append("<br></br>")
        end
        if not stringValidationUtil:isValidRequired(self:getState(), StreetAddressData.MIN, StreetAddressData.MAX) then
            stringBuffer:append("Please enter a valid state")
            stringBuffer:append("<br></br>")
        end
        if not stringValidationUtil:isValidRequired(self:getCode(), StreetAddressData.MIN, StreetAddressData.MAX) then
            stringBuffer:append("Please enter a valid zipcode")
            stringBuffer:append("<br></br>")
        end
        if not stringValidationUtil:isValidRequired(self:getCountry(), StreetAddressData.MIN, StreetAddressData.MAX) then
            stringBuffer:append("Please enter a valid country")
            stringBuffer:append("<br></br>")
        end
        return tostring(stringBuffer)
end


function StreetAddress:toValidationInfoDoc()
        return nil
end


function StreetAddress:toValidationInfoNode(document)
        local try_ok, try_error, try_value = pcall(function()
            local node = document:createElement(StreetAddressData.FORM)
            node:appendChild(self:toXmlNode(document))
            do return "__jreturn", node end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGINGERROR) then
                local commonStrings = CommonStrings.getInstance()
                self.logUtil:put(commonStrings.EXCEPTION, self, "toValidationInfoNode", e)
            end
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function StreetAddress:toHashMap()
        local hashMap = StdUtil.getInstance():createHashMap()
        hashMap:put(StreetAddressData.ID, self.id)
        hashMap:put(StreetAddressData.NAME, self.name_f)
        hashMap:put(StreetAddressData.STREET, self.street)
        hashMap:put(StreetAddressData.CITY, self.city)
        hashMap:put(StreetAddressData.STATE, self.state)
        hashMap:put(StreetAddressData.CODE, self.code)
        hashMap:put(StreetAddressData.COUNTRY, self.country)
        return hashMap
end


-- throws Exception
function StreetAddress:toXmlNode(document)
        local stringUtil = StringUtil.getInstance()
        local hashMap = self:toHashMap()
        local keySet = hashMap:keySet()
        local keyArray = keySet:toArray()
        local size = (keyArray.n or #keyArray)
        local node = document:createElement(StreetAddressData.ADDRESS)
        for i = 0, size - 1 do
            local name = keyArray[i + 1]
            local value = stringUtil:getNonNull(hashMap:get(name))
            node:appendChild(ModDomHelper.createNameValueNodes(document, name, value))
        end
        return node
end

return StreetAddress

