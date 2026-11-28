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
-- package org.allbinary.business.user.commerce.money.payment.types

local BasicPaymentType = {}
package.loaded["org.allbinary.business.user.commerce.money.payment.types.BasicPaymentType"] = BasicPaymentType

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
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local PaymentGatewayData = java_lazy("org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayData")
local PaymentGatewayInterfaceFactoryInterface = java_lazy("org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayInterfaceFactoryInterface")
local PaymentGatewayDomNodeFactoryInterface = java_lazy("org.allbinary.business.user.commerce.money.payment.gateway.modules.gateway.PaymentGatewayDomNodeFactoryInterface")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local AbPathData = java_lazy("org.allbinary.logic.io.path.AbPathData")
local Replace = java_lazy("org.allbinary.logic.string.regex.replace.Replace")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local BasicPaymentTypeUtil = java_lazy("org.allbinary.business.user.commerce.money.payment.types.BasicPaymentTypeUtil")

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

-- class table BasicPaymentType is declared before the requires
BasicPaymentType.__index = BasicPaymentType
BasicPaymentType.className = "BasicPaymentType"
BasicPaymentType.javaClassName = "org.allbinary.business.user.commerce.money.payment.types.BasicPaymentType"

function BasicPaymentType:_init_fields()
    if self.name_f == nil then self.name_f = nil end
    if self.value == nil then self.value = nil end
    if self.paymentGatewayInterfaceFactoryInterface == nil then self.paymentGatewayInterfaceFactoryInterface = nil end
    if self.paymentGatewayDomNodeFactoryInterface == nil then self.paymentGatewayDomNodeFactoryInterface = nil end
end

function BasicPaymentType._jinit(self, ...)
    local count = select("#", ...)
    if count == 1 then return BasicPaymentType._new1(self, ...)
    elseif count == 3 then return BasicPaymentType._new3(self, ...)
    end
    error("No constructor of BasicPaymentType takes " .. count .. " arguments")
end

function BasicPaymentType.new(...)
    local self = setmetatable({}, BasicPaymentType)
    BasicPaymentType._jinit(self, ...)
    return self
end


function BasicPaymentType._new1(self, paymentMethod)
    BasicPaymentType._init_fields(self)
        self:init(paymentMethod)
    return self
end


function BasicPaymentType._new3(self, paymentMethod, paymentGatewayInterfaceFactoryInterface, paymentGatewayDomNodeFactoryInterface)
    BasicPaymentType._init_fields(self)
        self:init(paymentMethod)
        self.paymentGatewayInterfaceFactoryInterface = paymentGatewayInterfaceFactoryInterface
        self.paymentGatewayDomNodeFactoryInterface = paymentGatewayDomNodeFactoryInterface
    return self
end


function BasicPaymentType:init(paymentMethod)
        local hashMap = StdUtil.getInstance():createHashMap()
        local UNDERSCORE = "_"
        hashMap:put(CommonSeps.getInstance().SPACE, UNDERSCORE)
        hashMap:put(AbPathData.getInstance().EXTENSION_SEP, UNDERSCORE)
        hashMap:put("-", UNDERSCORE)
        local replace = Replace.new(hashMap)
        self.name_f = replace:all(paymentMethod)
        self.value = paymentMethod
        BasicPaymentTypeUtil.getInstance():add(self)
end


function BasicPaymentType:getName()
        return self.name_f
end


function BasicPaymentType:getValue()
        return self.value
end


-- throws Exception
function BasicPaymentType:getPaymentGatewayInterfaceFactoryInterface()
        if rawequal(self.paymentGatewayInterfaceFactoryInterface, nil) then
            error(require("java.lang.Exception").new("PaymentGatewayInterfaceFactoryInterface is Null"), 0)
        end
        return self.paymentGatewayInterfaceFactoryInterface
end


-- throws Exception
function BasicPaymentType:getPaymentGatewayDomNodeFactoryInterface()
        if rawequal(self.paymentGatewayDomNodeFactoryInterface, nil) then
            error(require("java.lang.Exception").new("PaymentGatewayDomNodeFactoryInterface is Null"), 0)
        end
        return self.paymentGatewayDomNodeFactoryInterface
end


function BasicPaymentType:getKey()
        return self:getName()
end


function BasicPaymentType:toVector()
        local vector = BasicArrayListD.new()
        vector:add(self.name_f)
        vector:add(self.value)
        return vector
end


function BasicPaymentType:toHashMap()
        local hashMap = StdUtil.getInstance():createHashMap()
        hashMap:put(tostring(PaymentGatewayData.NAME), self.name_f)
        hashMap:put(tostring(PaymentGatewayData.VALUE), self.value)
        return hashMap
end


function BasicPaymentType:toString()
        return self.name_f
end
BasicPaymentType.__tostring = function(self) return self:toString() end

return BasicPaymentType

