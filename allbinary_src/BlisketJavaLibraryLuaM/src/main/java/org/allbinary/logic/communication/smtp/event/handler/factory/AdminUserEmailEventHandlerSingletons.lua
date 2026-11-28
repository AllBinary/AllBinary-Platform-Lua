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

local AdminUserEmailEventHandlerSingletons = {}
package.loaded["org.allbinary.logic.communication.smtp.event.handler.factory.AdminUserEmailEventHandlerSingletons"] = AdminUserEmailEventHandlerSingletons

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

-- class table AdminUserEmailEventHandlerSingletons is declared before the requires
AdminUserEmailEventHandlerSingletons.__index = AdminUserEmailEventHandlerSingletons
AdminUserEmailEventHandlerSingletons.className = "AdminUserEmailEventHandlerSingletons"
AdminUserEmailEventHandlerSingletons.javaClassName = "org.allbinary.logic.communication.smtp.event.handler.factory.AdminUserEmailEventHandlerSingletons"

function AdminUserEmailEventHandlerSingletons:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.userEmailEventHandlerHashMap = StdUtil.getInstance():createHashMap()
end


function AdminUserEmailEventHandlerSingletons.getInstance()
        return AdminUserEmailEventHandlerSingletons.instance_f
end
AdminUserEmailEventHandlerSingletons.getInstance__static = AdminUserEmailEventHandlerSingletons.getInstance


function AdminUserEmailEventHandlerSingletons._jinit(self)
    AdminUserEmailEventHandlerSingletons._init_fields(self)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().EMAILLOGGING) then
            self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        end
    return self
end

function AdminUserEmailEventHandlerSingletons.new(...)
    local self = setmetatable({}, AdminUserEmailEventHandlerSingletons)
    AdminUserEmailEventHandlerSingletons._jinit(self, ...)
    return self
end


-- throws Exception
function AdminUserEmailEventHandlerSingletons:getInstance(abeClientInformation, userEmailEventNameData)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().EMAILLOGGING) then
            self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.GET_INSTANCE)
        end
        local userEmailEventHandler = self.userEmailEventHandlerHashMap:get(userEmailEventNameData)
        if rawequal(userEmailEventHandler, nil) then
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().EMAILLOGGING) then
                self.logUtil:putF("Creating New Named UserEmailEventHandler", self, self.commonStrings.GET_INSTANCE)
            end
            local userVector = UserEntityFactory.getInstance():getAdministrators()
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
AdminUserEmailEventHandlerSingletons.getInstance__instance = AdminUserEmailEventHandlerSingletons.getInstance
function AdminUserEmailEventHandlerSingletons.getInstance(...)
                
    if select("#", ...) == 0 then return AdminUserEmailEventHandlerSingletons.getInstance__static() end
                
    return AdminUserEmailEventHandlerSingletons.getInstance__instance(...)
                
end

AdminUserEmailEventHandlerSingletons.instance_f = AdminUserEmailEventHandlerSingletons.new()

return AdminUserEmailEventHandlerSingletons

