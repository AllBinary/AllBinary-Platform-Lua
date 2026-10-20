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

-- local HashMap = require("java.util.HashMap")
-- local Set = require("java.util.Set")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
local DomNodeHelper = require("org.allbinary.data.tree.dom.DomNodeHelper")
local DomSearchHelper = require("org.allbinary.data.tree.dom.DomSearchHelper")
local ModDomHelper = require("org.allbinary.data.tree.dom.ModDomHelper")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local StreetAddress = {}
StreetAddress.__index = StreetAddress
StreetAddress.className = "StreetAddress"

function StreetAddress:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.id = nil
    self.name = nil
    self.street = nil
    self.city = nil
    self.state = nil
    self.code = nil
    self.country = nil
    self.isDefault = false
end

function StreetAddress.new(...)
    local count = select("#", ...)
    if count == 0 then return StreetAddress._new0(...)
    elseif count == 1 then return StreetAddress._new1(...)
    elseif count == 1 then return StreetAddress._new1(...)
    elseif count == 1 then return StreetAddress._new1(...)
    elseif count == 6 then return StreetAddress._new6(...)
    elseif count == 1 then return StreetAddress._new1(...)
    end
end


function StreetAddress._new0()
    local self = setmetatable({}, StreetAddress)
    self:_init_fields()
    return self
end


function StreetAddress._new1(node)
    local self = setmetatable({}, StreetAddress)
    self:_init_fields()
        local nameNode = DomSearchHelper.getNode(StreetAddressData.NAME, node:getChildNodes())
        self.name = DomNodeHelper.getTextNodeValue(nameNode)
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


function StreetAddress._new1(streetAddress)
    local self = setmetatable({}, StreetAddress)
    self:_init_fields()
        self.id = streetAddress:getId()
        self.name = streetAddress:getName()
        self.street = streetAddress:getStreet()
        self.city = streetAddress:getCity()
        self.state = streetAddress:getState()
        self.code = streetAddress:getCode()
        self.country = streetAddress:getCountry()
        self.isDefault = streetAddress:isDefault()
        self:log()
    return self
end


function StreetAddress._new1(request)
    local self = setmetatable({}, StreetAddress)
    self:_init_fields()
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


function StreetAddress._new6(name, street, city, state, code, country)
    local self = setmetatable({}, StreetAddress)
    self:_init_fields()
        self.name = name
        self.street = street
        self.city = city
        self.state = state
        self.code = code
        self.country = country
        self:log()
    return self
end


function StreetAddress._new1(address)
    local self = setmetatable({}, StreetAddress)
    self:_init_fields()
        self.id = address:get(StreetAddressData.ID)
        self.name = address:get(StreetAddressData.NAME)
        self.street = address:get(StreetAddressData.STREET)
        self.city = address:get(StreetAddressData.CITY)
        self.state = address:get(StreetAddressData.STATE)
        self.code = address:get(StreetAddressData.CODE)
        self.country = address:get(StreetAddressData.COUNTRY)
        local def = address:get(StreetAddressData.DEFAULT)
        if def ~= nil and ((def < StreetAddressData.DEFAULT and -1) or (def > StreetAddressData.DEFAULT and 1) or 0) == 0 then
            self.isDefault = true
        else
            self.isDefault = false
        end
        self:log()
    return self
end


function StreetAddress:log()
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
            self.logUtil:putF("Created Address: \n" .. tostring(self:toHashMap()), self, "log")
        end
end


function StreetAddress:setId(id)
        self.id = id
end


function StreetAddress:setName(name)
        self.name = name
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
        return self.name
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
        return self.isDefault
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
        local try_ok, try_error = pcall(function()
            local node = document:createElement(StreetAddressData.FORM)
            node:appendChild(self:toXmlNode(document))
            return node
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGINGERROR) then
                local commonStrings = CommonStrings.getInstance()
                self.logUtil:put(commonStrings.EXCEPTION, self, "toValidationInfoNode", e)
            end
            return nil
        end
end


function StreetAddress:toHashMap()
        local hashMap = StdUtil.getInstance():createHashMap()
        hashMap:put(StreetAddressData.ID, self.id)
        hashMap:put(StreetAddressData.NAME, self.name)
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

