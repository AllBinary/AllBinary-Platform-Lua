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
-- package admin.taghelpers

local WorkFlowRequestHelper = {}
package.loaded["admin.taghelpers.WorkFlowRequestHelper"] = WorkFlowRequestHelper

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
-- local PageContext = require("javax.servlet.jsp.PageContext")
local WorkFlowEntityFactory = java_lazy("org.allbinary.data.tables.workflow.WorkFlowEntityFactory")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local NewWorkFlowFactory = java_lazy("org.allbinary.logic.control.workflow.NewWorkFlowFactory")
local WorkFlowData = java_lazy("org.allbinary.logic.control.workflow.WorkFlowData")
local WorkFlowInterface = java_lazy("org.allbinary.logic.control.workflow.WorkFlowInterface")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local ServiceClientInformationInterfaceFactory = java_lazy("org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local ModifyTable = require("admin.taghelpers.ModifyTable")

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

local function java_super_init(base, self, ...)
    local init = rawget(base, "_jinit")
    if init ~= nil then return init(self, ...) end
    if base.new ~= nil then
        local object = base.new(...)
        if type(object) == "table" then
            for key, value in pairs(object) do if rawget(self, key) == nil then self[key] = value end end
        end
    end
end

local function java_overload(class, name, count, test)
    local parent = getmetatable(class)
    local base = parent and parent.__index
    if type(base) ~= "table" or base == class then return end
    local override = rawget(class, name)
    local mangled = name .. "_j" .. count
    -- an inherited overload with the same count and other parameter types (Control.drawBackground(hDC, rect, pixel, tx, ty)
    -- and Canvas.drawBackground(gc, x, y, width, height)) is called when the arguments do not match the override
    local typed = function(self, ...)
        if test == nil or test(...) then return override(self, ...) end
        local inherited = base[mangled]
        if inherited == nil then local plain = base[name] if plain ~= nil and plain ~= base[name .. "__jdispatcher"] then inherited = plain end end
        if inherited == nil or inherited == override then return override(self, ...) end
        return inherited(self, ...)
    end
    class[mangled] = typed
    -- the inherited method is looked up at the call: the base class can still be loading (require cycle)
    local dispatcher = function(self, ...)
        if select("#", ...) == count then return typed(self, ...) end
        local inherited = base[name]
        if inherited == nil then return override(self, ...) end
        return inherited(self, ...)
    end
    class[name] = dispatcher
    class[name .. "__jdispatcher"] = dispatcher
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

-- class table WorkFlowRequestHelper is declared before the requires
WorkFlowRequestHelper.__index = WorkFlowRequestHelper
WorkFlowRequestHelper.className = "WorkFlowRequestHelper"
WorkFlowRequestHelper.javaClassName = "admin.taghelpers.WorkFlowRequestHelper"
setmetatable(WorkFlowRequestHelper, {__index = ModifyTable})

function WorkFlowRequestHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.abeClientInformation = ServiceClientInformationInterfaceFactory.getInstance()
    if self.workFlowInterface == nil then self.workFlowInterface = nil end
end


function WorkFlowRequestHelper._jinit(self, hashMap, pageContext)
    java_super_init(ModifyTable, self)
    WorkFlowRequestHelper._init_fields(self)
        self.workFlowInterface = NewWorkFlowFactory.getInstance():getInstance(self.abeClientInformation, hashMap, pageContext)
    return self
end

function WorkFlowRequestHelper.new(...)
    local self = setmetatable({}, WorkFlowRequestHelper)
    WorkFlowRequestHelper._jinit(self, ...)
    return self
end


-- throws Exception
function WorkFlowRequestHelper:delete()
        local try_ok, try_error, try_value = pcall(function()
            local stringUtil = StringUtil.getInstance()
            WorkFlowEntityFactory.getInstance():create2():delete(self.workFlowInterface:getName(), stringUtil.EMPTY_STRING)
            local success = require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string("Successfully Removed the workflow with ") .. require("allbinary_java").to_string(WorkFlowData.getInstance().NAME)) .. require("allbinary_java").to_string("= ")) .. require("allbinary_java").to_string(self.workFlowInterface:getName())) .. require("allbinary_java").to_string(" from ")
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "delete()")
            end
            do return "__jreturn", success end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local try_ok, try_error, try_value = pcall(function()
                local error = require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string("Failed to remove workflow with ") .. require("allbinary_java").to_string(WorkFlowData.getInstance().NAME)) .. require("allbinary_java").to_string("= ")) .. require("allbinary_java").to_string(self.workFlowInterface:getName())) .. require("allbinary_java").to_string(" from ")
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                    self.logUtil:put(self.commonStrings.EXCEPTION, self, "delete()", e)
                end
                error(require("java.lang.Exception").new(e), 0)
            end)
            if not try_ok then
                local e2 = try_error
                if type(e2) ~= "table" then e2 = require("java.lang.RuntimeException").new(tostring(e2)) end
                local error = "Failed to get data from workflowinterface to set error string"
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                    self.logUtil:put(self.commonStrings.EXCEPTION, self, "delete()", e2)
                end
                return error
            end
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(WorkFlowRequestHelper, "delete", 0)


function WorkFlowRequestHelper:insert()
        local try_ok, try_error, try_value = pcall(function()
            local success = "New User Successfully added to the Users Table"
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "add()")
            end
            do return "__jreturn", success end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local error = "Failed to add User"
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "add()", e)
            end
            return error
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(WorkFlowRequestHelper, "insert", 0)


function WorkFlowRequestHelper:update()
        local try_ok, try_error, try_value = pcall(function()
            local success = "Updated WorkFlow Successfully"
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "update()")
            end
            do return "__jreturn", success end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local error = "Failed to update WorkFlow"
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "update()", e)
            end
            return error
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(WorkFlowRequestHelper, "update", 0)

return WorkFlowRequestHelper

