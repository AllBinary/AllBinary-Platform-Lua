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
-- package org.allbinary.logic.communication.smtp.event.handler.factory

local StoreAdminUserEmailEventHandlerSingletons = {}
package.loaded["org.allbinary.logic.communication.smtp.event.handler.factory.StoreAdminUserEmailEventHandlerSingletons"] = StoreAdminUserEmailEventHandlerSingletons

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
local StoreFrontInterface = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local UserEntityFactory = java_lazy("org.allbinary.data.tables.user.UserEntityFactory")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local UserEmailEventNameData = java_lazy("org.allbinary.logic.communication.smtp.event.UserEmailEventNameData")
local EmailEventHandlerUtil = java_lazy("org.allbinary.logic.communication.smtp.event.handler.EmailEventHandlerUtil")
local UserEmailEventHandler = java_lazy("org.allbinary.logic.communication.smtp.event.handler.UserEmailEventHandler")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
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

-- class table StoreAdminUserEmailEventHandlerSingletons is declared before the requires
StoreAdminUserEmailEventHandlerSingletons.__index = StoreAdminUserEmailEventHandlerSingletons
StoreAdminUserEmailEventHandlerSingletons.className = "StoreAdminUserEmailEventHandlerSingletons"
StoreAdminUserEmailEventHandlerSingletons.javaClassName = "org.allbinary.logic.communication.smtp.event.handler.factory.StoreAdminUserEmailEventHandlerSingletons"

function StoreAdminUserEmailEventHandlerSingletons:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.userEmailEventHandlerHashMap = StdUtil.getInstance():createHashMap()
end


function StoreAdminUserEmailEventHandlerSingletons.getInstance()
        return StoreAdminUserEmailEventHandlerSingletons.instance_f
end
StoreAdminUserEmailEventHandlerSingletons.getInstance__static = StoreAdminUserEmailEventHandlerSingletons.getInstance


function StoreAdminUserEmailEventHandlerSingletons._jinit(self)
    StoreAdminUserEmailEventHandlerSingletons._init_fields(self)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().EMAILLOGGING) then
            self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        end
    return self
end

function StoreAdminUserEmailEventHandlerSingletons.new(...)
    local self = setmetatable({}, StoreAdminUserEmailEventHandlerSingletons)
    StoreAdminUserEmailEventHandlerSingletons._jinit(self, ...)
    return self
end


-- throws Exception
function StoreAdminUserEmailEventHandlerSingletons:getInstance(userEmailEventNameData, abeClientInformation, storeFrontInterface)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().EMAILLOGGING) then
            self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.GET_INSTANCE)
        end
        local userEmailEventHandler = self.userEmailEventHandlerHashMap:get(userEmailEventNameData)
        if rawequal(userEmailEventHandler, nil) then
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().EMAILLOGGING) then
                self.logUtil:putF("Creating New Named UserEmailEventHandler", self, self.commonStrings.GET_INSTANCE)
            end
            local userVector = UserEntityFactory.getInstance():getStoreManagers(storeFrontInterface)
            local newUserEmailEventHandler = EmailEventHandlerUtil.getInstance():getEventHandler(abeClientInformation, userEmailEventNameData, userVector)
            self.userEmailEventHandlerHashMap:put(userEmailEventNameData, newUserEmailEventHandler)
            return newUserEmailEventHandler
        else
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().EMAILLOGGING) then
                self.logUtil:putF("Returning existing UserEmailEventHandler", self, self.commonStrings.GET_INSTANCE)
            end
            return userEmailEventHandler
        end
end
StoreAdminUserEmailEventHandlerSingletons.getInstance__instance = StoreAdminUserEmailEventHandlerSingletons.getInstance
function StoreAdminUserEmailEventHandlerSingletons.getInstance(...)
                
    if select("#", ...) == 0 then return StoreAdminUserEmailEventHandlerSingletons.getInstance__static() end
                
    return StoreAdminUserEmailEventHandlerSingletons.getInstance__instance(...)
                
end

StoreAdminUserEmailEventHandlerSingletons.instance_f = StoreAdminUserEmailEventHandlerSingletons.new()

return StoreAdminUserEmailEventHandlerSingletons

