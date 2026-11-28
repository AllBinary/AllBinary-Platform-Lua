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
-- package org.allbinary.business.user.commerce.money

local Money = {}
package.loaded["org.allbinary.business.user.commerce.money.Money"] = Money

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

local AbPathData = java_lazy("org.allbinary.logic.io.path.AbPathData")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local StringValidationUtil = java_lazy("org.allbinary.logic.string.StringValidationUtil")
local CommonPhoneStrings = java_lazy("org.allbinary.string.CommonPhoneStrings")

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

-- class table Money is declared before the requires
Money.__index = Money
Money.className = "Money"
Money.javaClassName = "org.allbinary.business.user.commerce.money.Money"

function Money:_init_fields()
    if self.units == nil then self.units = nil end
    self.DEFAULT_CURRENCY = "USD"
end

function Money._jinit(self, ...)
    local count = select("#", ...)
    if count == 1 then return Money._new1(self, ...)
    elseif count == 0 then return Money._new0(self, ...)
    end
    error("No constructor of Money takes " .. count .. " arguments")
end

function Money.new(...)
    local self = setmetatable({}, Money)
    Money._jinit(self, ...)
    return self
end

function Money._new1(self, ...)
    local java_a1 = ...
    if true and (java_a1 == nil or java_is(java_a1, "Money")) then return Money._new1_1(self, ...) end
    if true and (java_a1 == nil or type(java_a1) == "string") then return Money._new1_2(self, ...) end
    return Money._new1_3(self, ...)
end


function Money._new1_1(self, money)
    Money._init_fields(self)
        self.units = money:getUnits()
    return self
end


function Money._new0(self)
    Money._init_fields(self)
        self.units = 0
    return self
end


function Money._new1_2(self, usDollarStr)
    Money._init_fields(self)
        if not rawequal(usDollarStr, nil) and StringValidationUtil.getInstance():isNumber(usDollarStr) then
            self.units = self:convertUsdToUnits(usDollarStr)
        end
    return self
end


function Money._new1_3(self, units)
    Money._init_fields(self)
        self.units = units
    return self
end


function Money:isValid()
        if not rawequal(self.units, nil) and require("allbinary_java").number_value(self.units, "longValue") > 0 and require("allbinary_java").number_value(self.units, "longValue") < require("java.lang.Long").MAX_VALUE then
            return true
        else
            return false
        end
end


function Money:add_j1_1(moreMoney)
        self:add(tostring(moreMoney))
end


function Money:add_j1_2(usDollarStr)
        self.units = require("allbinary_java").number_value(self.units, "longValue") + self:convertUsdToUnits(usDollarStr)
end
function Money:add(...)
    local count = select("#", ...)
    if count == 1 then return self:add_j1(...) end
    error("No method add takes " .. count .. " arguments")
end
Money.add__jdispatcher = Money.add
function Money:add_j1(...)
    local java_a1 = ...
    if true and (java_a1 == nil or java_is(java_a1, "Money")) then return Money.add_j1_1(self, ...) end
    return Money.add_j1_2(self, ...)
end


function Money:subtract(usDollarStr)
        self.units = require("allbinary_java").number_value(self.units, "longValue") - self:convertUsdToUnits(usDollarStr)
end


function Money:multiply_j1_1(multiplier)
        self.units = require("allbinary_java").number_value(require("allbinary_java").number_value(self.units, "longValue") * (multiplier + 0.0), "longValue")
end


function Money:multiply_j1_2(multiplier)
        self.units = require("allbinary_java").number_value(self.units, "longValue") * multiplier
end
function Money:multiply(...)
    local count = select("#", ...)
    if count == 1 then return self:multiply_j1(...) end
    error("No method multiply takes " .. count .. " arguments")
end
Money.multiply__jdispatcher = Money.multiply
function Money:multiply_j1(...)
    local java_a1 = ...
    if true and (java_a1 == nil or type(java_a1) == "number") then return Money.multiply_j1_1(self, ...) end
    return Money.multiply_j1_2(self, ...)
end


function Money:convertUnitsTo(currency)
        local stringBuffer = StringMaker.new()
        if rawequal(((currency < self.DEFAULT_CURRENCY and -1) or (currency > self.DEFAULT_CURRENCY and 1) or 0), 0) then
            local dollar = require("allbinary_java").number_value(self.units, "longValue") / 100
            local cents = require("allbinary_java").number_value(self.units, "longValue") - (dollar * 100)
            stringBuffer:append(tostring(dollar))
            stringBuffer:append(AbPathData.getInstance().EXTENSION_SEP)
            if cents < 10 then
                stringBuffer:append(CommonPhoneStrings.getInstance().ZERO)
            end
            stringBuffer:append(tostring(cents))
        end
        return tostring(stringBuffer)
end


function Money:convertUsdToUnits(usDollarStr)
        local localUnit = 0
        local index = ((string.find(usDollarStr, AbPathData.getInstance().EXTENSION_SEP, 1, true) or 0) - 1)
        local stringUtil = StringUtil.getInstance()
        local dollarStr = stringUtil.EMPTY_STRING
        local centsStr = stringUtil.EMPTY_STRING
        if index < 1 then
            dollarStr = tostring(usDollarStr)
            centsStr = "00"
        else
            dollarStr = tostring(string.sub(usDollarStr, (0) + 1, index))
            centsStr = tostring(string.sub(usDollarStr, (index + 1) + 1))
        end
        localUnit = require("allbinary_java").number_value(require("allbinary_java").number_value(dollarStr, "longValue") * 100, "longValue")
        localUnit = localUnit + (require("allbinary_java").number_value(centsStr, "longValue"))
        return localUnit
end


function Money:getUnits()
        return require("allbinary_java").number_value(self.units, "longValue")
end


function Money:getUnitsLong()
        return self.units
end


function Money:toString()
        return tostring(self:convertUnitsTo(self.DEFAULT_CURRENCY))
end
Money.__tostring = function(self) return self:toString() end

return Money

