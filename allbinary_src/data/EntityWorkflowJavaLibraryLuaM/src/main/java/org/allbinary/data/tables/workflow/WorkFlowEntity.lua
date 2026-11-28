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
-- package org.allbinary.data.tables.workflow

local WorkFlowEntity = {}
package.loaded["org.allbinary.data.tables.workflow.WorkFlowEntity"] = WorkFlowEntity

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
local DynamicObjectData = java_lazy("org.allbinary.business.DynamicObjectData")
local StoreFrontData = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontData")
local EntryData = java_lazy("org.allbinary.business.entry.EntryData")
local UserDbInitInfo = java_lazy("org.allbinary.business.init.db.UserDbInitInfo")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AbSqlBean = require("org.allbinary.logic.communication.sql.AbSqlBean")
local DbWorkFlowFactory = java_lazy("org.allbinary.logic.control.workflow.DbWorkFlowFactory")
local WorkFlowData = java_lazy("org.allbinary.logic.control.workflow.WorkFlowData")
local WorkFlowInterface = java_lazy("org.allbinary.logic.control.workflow.WorkFlowInterface")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local LicensingException = java_lazy("org.allbinary.logic.system.security.licensing.LicensingException")
local ServiceClientInformationInterfaceFactory = java_lazy("org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local WorkFlowEntityInterface = require("org.allbinary.data.tables.workflow.WorkFlowEntityInterface")

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

local function java_super(class, name, count)
    local mangled = name .. "_j" .. count
    local current = class
    while type(current) == "table" do
        local method = rawget(current, mangled)
        if method ~= nil then return method end
        method = rawget(current, name)
        if method ~= nil and method ~= rawget(current, name .. "__jdispatcher") then return method end
        local parent = getmetatable(current)
        local index = parent and parent.__index
        if index == current then index = nil end
        current = index
    end
    return class[name]
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

-- class table WorkFlowEntity is declared before the requires
WorkFlowEntity.__index = WorkFlowEntity
WorkFlowEntity.className = "WorkFlowEntity"
WorkFlowEntity.javaClassName = "org.allbinary.data.tables.workflow.WorkFlowEntity"
setmetatable(WorkFlowEntity, {__index = AbSqlBean})
WorkFlowEntity.java_implements = " WorkFlowEntityInterface "
WorkFlowEntity.java_interfaces = function() return {WorkFlowEntityInterface} end

function WorkFlowEntity:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.abeClientInformation = ServiceClientInformationInterfaceFactory.getInstance()
    self.tableName = "workflows"
    self.METHOD_GET = "get()"
    self.METHOD_UPDATE = "update"
end


function WorkFlowEntity._jinit(self)
    java_super_init(AbSqlBean, self, UserDbInitInfo.new())
    WorkFlowEntity._init_fields(self)
        -- super(...) made self above
        self:setTableName(self.tableName)
    return self
end

function WorkFlowEntity.new(...)
    local self = setmetatable({}, WorkFlowEntity)
    WorkFlowEntity._jinit(self, ...)
    return self
end


function WorkFlowEntity:insert(values)
        local try_ok, try_error, try_value = pcall(function()
            java_super(AbSqlBean, "insert", 1)(self, values)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:putF(self.commonStrings.SUCCESS, self, self.INSERT)
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, self.INSERT, e)
            end
        end
end
java_overload(WorkFlowEntity, "insert", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "BasicArrayList")) end)


function WorkFlowEntity:delete(name, storeName)
        local try_ok, try_error, try_value = pcall(function()
            local keysAndValues = StdUtil.getInstance():createHashMap()
            keysAndValues:put(WorkFlowData.getInstance().NAME, name)
            keysAndValues:put(StoreFrontData.getInstance().NAME, storeName)
            java_super(AbSqlBean, "deleteWhere", 1)(self, keysAndValues)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:putF(self.commonStrings.SUCCESS, self, self.commonStrings.delete)
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, self.commonStrings.delete, e)
            end
        end
end
java_overload(WorkFlowEntity, "delete", 2, function(java_a1, java_a2) return true and (java_a1 == nil or type(java_a1) == "string") and (java_a2 == nil or type(java_a2) == "string") end)


-- throws Exception, LicensingException
function WorkFlowEntity:get_j2(name, storeName)
        local try_ok, try_error, try_value = pcall(function()
            local keysAndValues = StdUtil.getInstance():createHashMap()
            keysAndValues:put(WorkFlowData.getInstance().NAME, name)
            keysAndValues:put(StoreFrontData.getInstance().NAME, storeName)
            local hashMap = java_super(AbSqlBean, "getRow", 1)(self, keysAndValues)
            do return "__jreturn", DbWorkFlowFactory.getInstance():getInstance(self.abeClientInformation, hashMap) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, self.METHOD_GET, e)
            end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function WorkFlowEntity:get_j1(storeName)
        local try_ok, try_error, try_value = pcall(function()
            local workFlowsVector = BasicArrayListD.new()
            local keysAndValues = StdUtil.getInstance():createHashMap()
            keysAndValues:put(StoreFrontData.getInstance().NAME, storeName)
            local hashMapVector = java_super(AbSqlBean, "getRows", 1)(self, keysAndValues)
            local size = hashMapVector:size()
            for i = 0, size - 1 do
                local workFlowHashMap = hashMapVector:get(i)
                if not rawequal(workFlowHashMap, nil) then
                    workFlowsVector:add(DbWorkFlowFactory.getInstance():getInstance(self.abeClientInformation, workFlowHashMap))
                end
            end
            do return "__jreturn", workFlowsVector end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, self.METHOD_GET, e)
            end
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
function WorkFlowEntity:get(...)
    local count = select("#", ...)
    if count == 2 then return self:get_j2(...) end
    if count == 1 then return self:get_j1(...) end
    local parent = getmetatable(WorkFlowEntity).__index
    if parent.get then return parent.get(self, ...) end
    error("No method get takes " .. count .. " arguments")
end
WorkFlowEntity.get__jdispatcher = WorkFlowEntity.get


function WorkFlowEntity:update(updatedValues)
        local try_ok, try_error, try_value = pcall(function()
            local wherekeysAndValues = StdUtil.getInstance():createHashMap()
            wherekeysAndValues:put(WorkFlowData.getInstance().NAME, updatedValues:get(WorkFlowData.getInstance().NAME))
            wherekeysAndValues:put(StoreFrontData.getInstance().NAME, updatedValues:get(StoreFrontData.getInstance().NAME))
            java_super(AbSqlBean, "updateWhere", 2)(self, wherekeysAndValues, updatedValues)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, self.METHOD_UPDATE, e)
            end
        end
end
java_overload(WorkFlowEntity, "update", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "HashMap")) end)


function WorkFlowEntity:createTableStatement()
        local workFlowData = WorkFlowData.getInstance()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.CREATE_TABLE):append(self.tableName):append(self.sqlStrings.START):append(workFlowData.NAME):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(StoreFrontData.getInstance().NAME):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(DynamicObjectData.NAME):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(workFlowData.DATA):append(self.sqlTypeStrings.BLOB_NOT_NULL):append(EntryData.getInstance().TIMECREATED):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(EntryData.getInstance().LASTMODIFIED):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(self.sqlStrings.PRIMARY_KEY):append(workFlowData.NAME):append(self.sqlStrings.END)
        return tostring(stringBuffer)
end
java_overload(WorkFlowEntity, "createTableStatement", 0)


function WorkFlowEntity:createTable()
        return java_super(AbSqlBean, "createTable", 1)(self, self:createTableStatement())
end
java_overload(WorkFlowEntity, "createTable", 0)


function WorkFlowEntity:dropTable()
        return java_super(AbSqlBean, "dropTable", 0)(self)
end
java_overload(WorkFlowEntity, "dropTable", 0)

return WorkFlowEntity

