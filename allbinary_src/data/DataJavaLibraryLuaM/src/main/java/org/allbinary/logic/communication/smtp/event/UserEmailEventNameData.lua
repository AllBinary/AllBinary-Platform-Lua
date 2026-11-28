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
-- package org.allbinary.logic.communication.smtp.event

local UserEmailEventNameData = {}
package.loaded["org.allbinary.logic.communication.smtp.event.UserEmailEventNameData"] = UserEmailEventNameData

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
local OrderHistoryData = java_lazy("org.allbinary.business.user.commerce.inventory.order.OrderHistoryData")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")

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

-- class table UserEmailEventNameData is declared before the requires
UserEmailEventNameData.__index = UserEmailEventNameData
UserEmailEventNameData.className = "UserEmailEventNameData"
UserEmailEventNameData.javaClassName = "org.allbinary.logic.communication.smtp.event.UserEmailEventNameData"

function UserEmailEventNameData:_init_fields()
    if self.eventNameId == nil then self.eventNameId = 0 end
    if self.eventHandlerName == nil then self.eventHandlerName = nil end
end


function UserEmailEventNameData._jinit(self, eventHandlerName)
    UserEmailEventNameData._init_fields(self)
        self.eventHandlerName = eventHandlerName
        self:initNextId()
        UserEmailEventNameData.userNameEvenNameHashMap:put(self.eventHandlerName, self)
    return self
end

function UserEmailEventNameData.new(...)
    local self = setmetatable({}, UserEmailEventNameData)
    UserEmailEventNameData._jinit(self, ...)
    return self
end


function UserEmailEventNameData:initNextId()
        self.eventNameId = UserEmailEventNameData.nextId
        UserEmailEventNameData.nextId = UserEmailEventNameData.nextId + 1
end


function UserEmailEventNameData:isEvent(userEmailEventNameString)
        return UserEmailEventNameData.userNameEvenNameHashMap:containsKey(userEmailEventNameString)
end


-- throws Exception
function UserEmailEventNameData.getInstance(userEmailEventNameString)
        local userEmailEventNameData = UserEmailEventNameData.userNameEvenNameHashMap:get(userEmailEventNameString)
        if rawequal(userEmailEventNameData, nil) then
            error(require("java.lang.Exception").new(), 0)
        else
            return userEmailEventNameData
        end
end


function UserEmailEventNameData:toString()
        return self.eventHandlerName
end
UserEmailEventNameData.__tostring = function(self) return self:toString() end

UserEmailEventNameData.userNameEvenNameHashMap = StdUtil.getInstance():createHashMap()
UserEmailEventNameData.nextId = 0
UserEmailEventNameData.INSTALLER = UserEmailEventNameData.new("Installer")
UserEmailEventNameData.EXCEPTION = UserEmailEventNameData.new("Exception")
UserEmailEventNameData.LOGGEDEXCEPTION = UserEmailEventNameData.new("Logged Exception")
UserEmailEventNameData.ERROR = UserEmailEventNameData.new("Error")
UserEmailEventNameData.OUTOFMEMORY = UserEmailEventNameData.new("Out Of Memory Error")
UserEmailEventNameData.ADMINGENERATINGSTATICPAGES = UserEmailEventNameData.new("Admin Generating Static Pages")
UserEmailEventNameData.STOREERROROCCURRED = UserEmailEventNameData.new("Store Error Occurred")
UserEmailEventNameData.STOREOUTOFMEMORY = UserEmailEventNameData.new("Store Out Of Memory Error")
UserEmailEventNameData.STORECREATED = UserEmailEventNameData.new("Store Created")
UserEmailEventNameData.STOREOPENED = UserEmailEventNameData.new("Store Opened")
UserEmailEventNameData.STORECLOSED = UserEmailEventNameData.new("Store Closed")
UserEmailEventNameData.STOREGENERATINGSTATICPAGES = UserEmailEventNameData.new("Store Generating Static Pages")
UserEmailEventNameData.PRODUCTISOUT = UserEmailEventNameData.new("Product Is Out")
UserEmailEventNameData.PRODUCTISAVAILABLE = UserEmailEventNameData.new("Product Is Available")
UserEmailEventNameData.PRODUCTISOLD = UserEmailEventNameData.new("Product Is Old")
UserEmailEventNameData.PRODUCTISONSALE = UserEmailEventNameData.new("Product Is On Sale")
UserEmailEventNameData.PRODUCTSALEISOVER = UserEmailEventNameData.new("Product Sale Is Over")
UserEmailEventNameData.ORDERPREPROCESSING = UserEmailEventNameData.new(OrderHistoryData.PREPROCESSING)
UserEmailEventNameData.ORDERPROCESSING = UserEmailEventNameData.new(OrderHistoryData.PROCESSING)
UserEmailEventNameData.ORDERCANCELLED = UserEmailEventNameData.new(OrderHistoryData.CANCELLED)
UserEmailEventNameData.ORDERPARTIALLYSHIPPED = UserEmailEventNameData.new(OrderHistoryData.PARTIALLYSHIPPED)
UserEmailEventNameData.ORDERSHIPPED = UserEmailEventNameData.new(OrderHistoryData.SHIPPED)
UserEmailEventNameData.QUOTEREQUEST = UserEmailEventNameData.new("Quote Request")
UserEmailEventNameData.NEWPASSWORD = UserEmailEventNameData.new("New Password")

return UserEmailEventNameData

