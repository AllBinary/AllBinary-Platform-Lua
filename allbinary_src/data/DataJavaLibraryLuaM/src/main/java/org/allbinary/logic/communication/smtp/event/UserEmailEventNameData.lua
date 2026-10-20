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

-- local HashMap = require("java.util.HashMap")
local OrderHistoryData = require("org.allbinary.business.user.commerce.inventory.order.OrderHistoryData")
local StdUtil = require("org.allbinary.logic.StdUtil")

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
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local UserEmailEventNameData = {}
UserEmailEventNameData.__index = UserEmailEventNameData
UserEmailEventNameData.className = "UserEmailEventNameData"

function UserEmailEventNameData:_init_fields()
    self.eventNameId = 0
    self.eventHandlerName = nil
end


function UserEmailEventNameData.new(eventHandlerName)
    local self = setmetatable({}, UserEmailEventNameData)
    self:_init_fields()
        self.eventHandlerName = eventHandlerName
        self:initNextId()
        UserEmailEventNameData.userNameEvenNameHashMap:put(self.eventHandlerName, self)
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
        if userEmailEventNameData == nil then
            error(java_exception("Exception"), 0)
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

