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
-- package org.allbinary.data.tables.log

local LogTableEntity = {}
package.loaded["org.allbinary.data.tables.log.LogTableEntity"] = LogTableEntity

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

local EntryData = java_lazy("org.allbinary.business.entry.EntryData")
local LogDbInitInfo = java_lazy("org.allbinary.business.init.db.LogDbInitInfo")
local AbeHttpRequestInfoData = java_lazy("org.allbinary.logic.communication.http.request.AbeHttpRequestInfoData")
local AbSqlBean = require("org.allbinary.logic.communication.sql.AbSqlBean")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local LogTableEntityInterface = require("org.allbinary.data.tables.log.LogTableEntityInterface")

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

-- class table LogTableEntity is declared before the requires
LogTableEntity.__index = LogTableEntity
LogTableEntity.className = "LogTableEntity"
LogTableEntity.javaClassName = "org.allbinary.data.tables.log.LogTableEntity"
setmetatable(LogTableEntity, {__index = AbSqlBean})
LogTableEntity.java_implements = " LogTableEntityInterface "
LogTableEntity.java_interfaces = function() return {LogTableEntityInterface} end

function LogTableEntity:_init_fields()
    self.tableName = "log"
end


function LogTableEntity._jinit(self)
    java_super_init(AbSqlBean, self, LogDbInitInfo.new())
    LogTableEntity._init_fields(self)
        -- super(...) made self above
        self:setTableName(self.tableName)
    return self
end

function LogTableEntity.new(...)
    local self = setmetatable({}, LogTableEntity)
    LogTableEntity._jinit(self, ...)
    return self
end


function LogTableEntity:createTableStatement()
        local abeHttpRequestInfoData = AbeHttpRequestInfoData.getInstance()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.sqlStrings.CREATE_TABLE):append(self.tableName):append(self.sqlStrings.START):append(self.sqlStrings.ID):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(abeHttpRequestInfoData.HTTP_USER_AGENT):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(abeHttpRequestInfoData.REMOTE_HOST):append(self.sqlTypeStrings.MAX_CHAR_COLUMN):append(abeHttpRequestInfoData.REMOTE_ADDRESS):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(abeHttpRequestInfoData.REQUEST_FILE_PATH):append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL):append(abeHttpRequestInfoData.REMOTE_PORT):append(self.sqlTypeStrings.MAX_INT_UNSIGNED_NOT_NULL):append(EntryData.getInstance().TIMECREATED):append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL):append(self.sqlStrings.PRIMARY_KEY):append(self.sqlStrings.ID):append(self.sqlStrings.END)
        return tostring(stringBuffer)
end
java_overload(LogTableEntity, "createTableStatement", 0)


function LogTableEntity:createTable()
        return java_super(AbSqlBean, "createTable", 1)(self, self:createTableStatement())
end
java_overload(LogTableEntity, "createTable", 0)


function LogTableEntity:deleteWhere(key, value)
        java_super(AbSqlBean, "deleteWhere", 2)(self, key, value)
end
java_overload(LogTableEntity, "deleteWhere", 2, function(java_a1, java_a2) return true and (java_a1 == nil or type(java_a1) == "string") and (java_a2 == nil or type(java_a2) == "string") end)


function LogTableEntity:insert(values)
        java_super(AbSqlBean, "insert", 1)(self, values)
end
java_overload(LogTableEntity, "insert", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "BasicArrayList")) end)


function LogTableEntity:dropTable()
        return java_super(AbSqlBean, "dropTable", 0)(self)
end
java_overload(LogTableEntity, "dropTable", 0)

return LogTableEntity

